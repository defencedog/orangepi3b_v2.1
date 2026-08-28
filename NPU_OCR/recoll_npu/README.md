# Recoll NPU-Accelerated OCR Integration Guide

**Target Hardware:** Orange Pi 3B (Rockchip RK3566, 1 TOPS NPU via `/dev/dri/renderD129`)  
**Purpose:** Offload Recoll's PDF and image OCR during document/ebook indexing from the slow CPU to the dedicated on-chip NPU using PP-OCR (PP-OCRv6 Det 1600 + PP-OCRv4 Rec).

---

## 📂 File Placement Map

| Source File | Destination Path | Permissions / Notes |
|---|---|---|
| `rclocrnpu.py` | `/usr/share/recoll/filters/rclocrnpu.py` | `chmod 755` (System-wide Recoll filter) |
| *(Alternative user-space)* | `~/.local/lib/python3.12/site-packages/rclocrnpu.py` | `chmod 755` (No sudo required) |
| `npu-ocr-pdf` | `/usr/local/bin/npu-ocr-pdf` | `chmod 755` (Executable wrapper) |
| `librknnrt.so` | `/usr/lib/librknnrt.so` | Run `sudo ldconfig` after copying |
| RKNN Models | `~/ppocr_rknn_6_1600/models/` (or `~/NPU_tools/models/ppocr/`) | `ppocrv6_det_1600_i8.rknn` & `ppocrv4_rec_fp16.rknn` |
| Python Virtualenv | `~/venv/npu_ocr` | Contains `rknn-toolkit-lite2`, `opencv-python`, `numpy` |

---

## ⚙️ Configuration Changes in `~/.recoll/recoll.conf`

Open `~/.recoll/recoll.conf` in an editor and add or update the following sections:

```ini
# ==============================================================================
# NPU-Accelerated OCR Configuration
# ==============================================================================

# Enable OCR for scanned PDFs with no text layer
pdfocr = 1

# Enable OCR for image files (png, jpg, tiff)
imgocr = 1

# Priority list of OCR engines (tries NPU first, falls back to Tesseract)
ocrprogs = npu tesseract

# Path to the NPU OCR wrapper script
npuocrcmd = /usr/local/bin/npu-ocr-pdf

# Enable 1-shot full-page detection (1 = enabled / fast, 0 = tiled)
npuocr_notile = 1

# Rendering resolution for OCR (DPI). 200 is optimal for speed and clarity
npuocr_dpi = 200

# Optional: Set multi-column reading order (1 = single column, 2 = 2-column, 3 = 3-column)
# Can also be set per-directory subtree (e.g. [/path/to/journals] npuocr_columns = 3)
# npuocr_columns = 1

# Tesseract fallback settings (used only if NPU is unavailable)
tesseractlang = eng

# ==============================================================================
# Performance & Indexing Daemon Settings (for RK3566 Quad-Core A55)
# ==============================================================================
# Use 2 worker threads to keep system responsive during indexing
thrQSizes = 2 -1 -1
thrTCounts = 2 1 1

# Follow symlinks if your documents are stored on external storage / RAID
followLinks = 1
```

---

## ⏱️ Performance Benchmarks & Throughput Estimates

### Per-Page Hardware Timing (RK3566 NPU)
* **Page Rendering (`pdftoppm` @ 200 DPI):** `~0.3 s` (CPU)
* **1-Shot Full Page Detection (PP-OCRv6 1600 INT8):** `~0.9 s` (NPU)
* **Text Line Recognition (PP-OCRv4 FP16):** `~0.060 s / line` (NPU)
  * Standard page (~50 lines): `~3.0 s`
  * Dense technical page (~100 lines/chunks): `~6.0 s`
* **Layout Sorting & Whitespace Splitting:** `~0.2 s` (CPU)

### Large Document / Textbook Estimation (e.g. 300 Pages)

| Document Density | Typical Content | Avg. Time / Page | **Total Time (300 Pages)** |
|---|---|---|---|
| **Standard Text Chapters** | Single column text, standard paragraphs, headings | **~10 – 14 sec** | **~50 – 65 minutes (~1 hour)** |
| **Dense Multi-Column / Technical** | 2-column layout, equations, data tables, process flowsheets | **~20 – 25 sec** | **~1 hr 40 min – 2 hours** |

### Comparison: NPU vs. CPU (Tesseract)

| Metric | CPU (Tesseract on 4× Cortex-A55) | **RK3566 NPU (Our Pipeline)** |
|---|---|---|
| **Speed per Page** | 60 – 90+ seconds | **10 – 25 seconds** (~4× – 6× faster) |
| **300-Page Total** | **~5.5 to 7.5 hours** | **~1 to 2 hours** |
| **CPU Load & Thermals** | 100% across all 4 cores (severe thermal throttling) | **CPU remains idle & cool (<15% load)** |
| **Reading Order** | Frequently jumbles multi-column articles | **Preserved via multi-column layout sorting** |

---

## 📚 Multi-Page Document & eBook Indexing Mechanics

### How Page-by-Page Extraction Works
Both the original Tesseract engine and our NPU engine handle multi-page documents page-by-page:

1. **Page Extraction:** The input PDF is split into per-page images via `pdftoppm` in a temporary directory.
2. **Page Text Generation:** 
   - `npu-ocr-pdf` processes each page on the NPU and generates `page_0001.txt`, `page_0002.txt`, ..., `page_000N.txt` (1 text file per page).
   - In Tesseract (`rclocrtesseract.py`), a loop ran `tesseract` per page image to generate `ocrXXXXXX-1.txt`, `ocrXXXXXX-2.txt`, etc.
3. **Form-Feed (`\x0c` / `\f`) Delimiting:**
   - Recoll's PDF filter (`rclpdf.py`) requires a Form Feed character (`\x0c` / `\f`) between pages.
   - `rclocrnpu.py` reads every `page_*.txt` file in sorted order and concatenates them with `b"\x0c"`.
   - **Why this matters:** When searching in the Recoll GUI / WebUI, Recoll uses these `\x0c` boundaries to pinpoint the exact physical page number (e.g. `[P. 4]`) where each match was found in your ebooks and multi-page PDFs.

---

## 🚀 How It Works Under the Hood

```
recollindex (Indexing Daemon / User Service)
   │
   ├── Checks PDF for native text layer via pdftotext
   │     ├─ [Has Text] ──> Indexed directly into Xapian DB
   │     └─ [No Text / Scanned] ──> Calls /usr/share/recoll/filters/rclocr.py
   │
   └── rclocr.py (Recoll OCR Dispatcher)
         │
         ├── 1. Check ~/.recoll/ocrcache (Cache Hit? Return text in <2 ms)
         │
         └── 2. Cache Miss ──> Invokes rclocrnpu.py (NPU Engine)
               │
               ├── Runs: npu-ocr-pdf <file.pdf> --dpi 200 --no-tile
               ├── 1-Shot Detection: PP-OCRv6 1600x1600 INT8 on NPU (~0.9 s)
               ├── Line Recognition: PP-OCRv4 FP16 on NPU (~0.06 s/line)
               ├── Whitespace-Aware Splitting: Prevents syllable stutter / duplicate letters
               ├── Concatenates pages with \x0c Form-Feed page breaks
               ├── Returns complete text stream to rclocr.py
               └── Stores result in ~/.recoll/ocrcache & indexes into Xapian DB
```

---

## 🧪 Verification & Testing Commands

### 1. Test NPU OCR Filter Standalone
```bash
python3 /usr/share/recoll/filters/rclocrnpu.py /path/to/scanned_document.pdf
```

### 2. Test Recoll OCR Dispatch & Caching
```bash
# First run (executes on NPU and caches):
python3 /usr/share/recoll/filters/rclocr.py /path/to/scanned_document.pdf

# Second run (instant cache hit from ~/.recoll/ocrcache in ~2 ms):
python3 /usr/share/recoll/filters/rclocr.py /path/to/scanned_document.pdf
```

### 3. Test Full PDF Extraction via Recoll
```bash
python3 /usr/share/recoll/filters/rclpdf.py /path/to/scanned_document.pdf
```

### 4. Query Search Results
```bash
recollq "search terms from scanned document"
```

---

## 🔄 Systemd User Service Setup (`recollindex.service`)

To run background real-time indexing continuously:

1. **Service file location:** `~/.config/systemd/user/recollindex.service`
2. **Service definition:**
```ini
[Unit]
Description=Recoll real-time document indexing
After=default.target

[Service]
Type=exec
ExecStart=/usr/bin/recollindex -m -D -x -w 30 -c %h/.recoll/
Restart=on-failure
RestartSec=60
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=default.target
```

3. **Enable and Start:**
```bash
systemctl --user daemon-reload
systemctl --user enable recollindex.service
systemctl --user start recollindex.service
systemctl --user status recollindex.service
```

4. **Monitoring logs in real time:**
```bash
journalctl -f --user-unit recollindex.service
```
