# PP-OCR on Rockchip RK3566 NPU (1600×1600 PP-OCRv6 + PP-OCRv4 Rec)

A self-contained, optimized, offline PDF OCR pipeline running on the **Rockchip RK3566 NPU** (1 TOPS) via `librknnrt` and `rknn-toolkit-lite2`.

---

## ⚡ Highlights

- **1-Shot Full-Page Detection:** PP-OCRv6 medium DBNet converted to static INT8 at **1600×1600**. With `--no-tile`, the entire page is detected in **1 single inference pass (~0.9 s)** on the NPU without tiling boundaries or seam cuts.
- **Whitespace-Aware Recognition:** Smart line slicing based on vertical projection whitespace valleys prevents mid-word splitting and eliminates syllable stutter / character duplication (`He ealth`, `proces ess`, `dat ata`).
- **Multi-Column Layout Sorter:** Software layout engine (`--columns N`) identifies full-width spanning headers/banners and partitions columns in natural reading order without destructive image slicing.
- **Accurate English Recognition:** Fast PP-OCRv4 FP16 recognizer (~64 ms/line) with a clean 6.6k dictionary.

---

## 📂 Package Structure

```
ppocr_rknn_6_1600/
├── librknnrt.so           # Rockchip NPU runtime v2.3.2 for aarch64
├── npu-ocr-pdf            # Shell wrapper script (place in PATH)
├── pdf_ocr.py             # Main OCR orchestration script
├── smoke_test.py          # Fast NPU diagnostic / model verification
├── README.md              # Setup and usage guide
├── OPTIMIZATIONS.md       # Detailed technical root-cause and benchmark report
├── models/
│   ├── ppocrv6_det_1600_i8.rknn   # 1600x1600 INT8 Detection model (24.9 MB)
│   ├── ppocrv4_rec_fp16.rknn      # 48x320 FP16 Recognition model (6.4 MB)
│   └── ppocr_keys_v1.txt          # Character dictionary
├── ppocr_rknn/            # Inference modules & post-processing
│   ├── ppocr_det.py
│   ├── ppocr_rec.py
│   ├── rknnlite_model.py
│   └── utils/
├── onnx/                  # (Optional) Source ONNX model
└── convert/               # (Optional) Conversion & reshape scripts
```

---

## 🚀 Quick Start (RK3566 / Orange Pi 3B)

### 1. Install the NPU Runtime Library

```bash
sudo cp librknnrt.so /usr/lib/
sudo ldconfig
```

### 2. Create Python Virtual Environment

```bash
python3 -m venv ~/venv/npu_ocr
source ~/venv/npu_ocr/bin/activate
```

### 3. Install Python Dependencies

```bash
pip install --upgrade pip
pip install rknn-toolkit-lite2==2.3.2 \
            opencv-python==4.11.0.86 \
            numpy==1.26.4 \
            six shapely pyclipper \
            "setuptools<81"
```

*System dependencies (for PDF rendering & metadata):*
```bash
sudo apt-get update && sudo apt-get install -y poppler-utils
```

### 4. Verify NPU Models

```bash
~/venv/npu_ocr/bin/python smoke_test.py
```
Expected output:
```
librknnrt.so: OK (loaded)
ppocrv6_det_1600_i8.rknn: OK  out=(1, 1, 1600, 1600)  ~0.9-1.6s
ppocrv4_rec_fp16.rknn: OK  out=(1, 40, 6625)  ~0.064s
smoke test done.
```

### 5. Install Wrapper Script

```bash
sudo cp npu-ocr-pdf /usr/local/bin/
sudo chmod +x /usr/local/bin/npu-ocr-pdf
```

---

## 📖 Usage & Examples

```bash
# 1-shot full page OCR for standard single-column documents:
npu-ocr-pdf document.pdf --no-tile

# 2-column or 3-column engineering articles & papers:
npu-ocr-pdf article.pdf --no-tile --columns 3
npu-ocr-pdf paper.pdf --no-tile --columns 2

# Specify custom output directory and emit JSON bounding boxes:
npu-ocr-pdf scan.pdf --no-tile --json --out-dir ./extracted_text

# High-DPI scanned documents with tiled fallback:
npu-ocr-pdf scanned_doc.pdf --dpi 250 --out-dir ./output
```

---

## 📊 Measured Performance (Orange Pi 3B / RK3566)

| Document | Layout | Pages | Detection Mode | Total Time | Per-Page Avg |
|---|---|---|---|---|---|
| `sample-compressor.pdf` | 3-Column Article | 5 | `--no-tile --columns 3` | ~2.5 min | ~30 s / page |
| `PublicWaterMassMailing.pdf` | 1-Column Scanned Letter | 8 | `--no-tile` | ~3.0 min | ~22 s / page |
| `sample-steam.pdf` | 2-Column Technical Paper | 9 | `--no-tile --columns 2` | ~3.5 min | ~23 s / page |

---

## 🔧 Environment Overrides (Optional)

| Environment Variable | Default | Description |
|---|---|---|
| `NPU_OCR_PYTHON` | `~/venv/npu_ocr/bin/python` | Path to Python interpreter |
| `NPU_OCR_MODELS_DIR` | `<package_dir>/models` | Directory containing `.rknn` models |
| `NPU_OCR_DET_MODEL` | `models/ppocrv6_det_1600_i8.rknn` | Custom detection model path |
| `NPU_OCR_REC_MODEL` | `models/ppocrv4_rec_fp16.rknn` | Custom recognition model path |
