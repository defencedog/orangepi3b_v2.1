#!/usr/bin/env python3
########################################################
# Running NPU OCR (PP-OCR on RK3566 NPU) for Recoll
# Interface required by rclocr.py
########################################################

import os
import sys
import glob
import subprocess
import rclexecm

_okexts = (".pdf", ".tif", ".tiff", ".jpg", ".png", ".jpeg")

npuocrcmd = None
tmpdir = None


def _deb(s):
    rclexecm.logmsg("rclocrnpu: %s" % s)


def _maybemaketmpdir():
    global tmpdir
    if tmpdir:
        if not tmpdir.vacuumdir():
            _deb("vacuumdir %s failed" % tmpdir.getpath())
            return False
    else:
        tmpdir = rclexecm.SafeTmpDir("rclocrnpu")
    return True


def cleanocr():
    global tmpdir
    if tmpdir:
        del tmpdir
        tmpdir = None


def ocrpossible(config, path):
    """Check if npu-ocr-pdf (or python pipeline) is available and input format is supported."""
    global npuocrcmd
    if not npuocrcmd:
        config.setKeyDir(os.path.dirname(path))
        npuocrcmd = config.getConfParam("npuocrcmd")
        if npuocrcmd:
            npuocrcmd = npuocrcmd.strip('"\'')
        else:
            npuocrcmd = rclexecm.which("npu-ocr-pdf")
        if not npuocrcmd:
            home = os.path.expanduser("~")
            candidates = [
                os.path.join(home, "NPU_tools", "npu-ocr-pdf"),
                os.path.join(home, "ppocr_rknn_6_1600", "npu-ocr-pdf"),
                os.path.join(home, "ppocr_rknn_6_1280", "npu-ocr-pdf"),
            ]
            for c in candidates:
                if os.path.isfile(c) and os.access(c, os.X_OK):
                    npuocrcmd = c
                    break

    if not npuocrcmd or not os.path.isfile(npuocrcmd):
        _deb("npu-ocr-pdf executable not found")
        return False

    base, ext = os.path.splitext(path)
    ext = ext.lower()
    if ext in _okexts:
        return True

    return False


def runocr(config, path):
    """Execute NPU-accelerated OCR and return extracted UTF-8 text bytes with form-feed page breaks."""
    if not _maybemaketmpdir():
        return False, b""

    config.setKeyDir(os.path.dirname(path))
    outdir = tmpdir.getpath()

    dpi = config.getConfParam("npuocr_dpi") or "200"
    cols = config.getConfParam("npuocr_columns") or "1"
    notile = config.getConfParam("npuocr_notile")
    use_notile = True if (notile is None or rclexecm.configparamtrue(notile)) else False

    cmd = [npuocrcmd, path, "--dpi", str(dpi), "--out-dir", outdir]
    if use_notile:
        cmd.append("--no-tile")
    if cols and str(cols) != "1":
        cmd.extend(["--columns", str(cols)])

    _deb("Running NPU OCR: %s" % " ".join(cmd))
    try:
        tmpdir.vacuumdir()
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode != 0:
            _deb("npu-ocr-pdf exited with code %d: %s" % (res.returncode, res.stderr))
            return False, b""
    except Exception as e:
        _deb("Execution of %s failed: %s" % (npuocrcmd, e))
        return False, b""

    txtfiles = sorted(glob.glob(os.path.join(outdir, "page_*.txt")))
    if not txtfiles:
        _deb("No page_*.txt files generated in %s" % outdir)
        return False, b""

    # Concatenate using form-feed (\x0c) as standard PDF page separator
    data = b""
    for tf in txtfiles:
        try:
            with open(tf, "rb") as f:
                data += f.read() + b"\x0c"
        except Exception as e:
            _deb("Failed to read %s: %s" % (tf, e))

    return True, data


if __name__ == "__main__":
    import rclconfig

    config = rclconfig.RclConfig()
    if len(sys.argv) < 2:
        print("Usage: rclocrnpu.py <document_path>")
        sys.exit(1)
    path = sys.argv[1]
    if ocrpossible(config, path):
        ok, data = runocr(config, path)
        if ok:
            sys.stdout.buffer.write(data)
            cleanocr()
            sys.exit(0)
        else:
            _deb("runocr failed")
            cleanocr()
            sys.exit(1)
    else:
        _deb("ocrpossible returned false")
        sys.exit(1)
