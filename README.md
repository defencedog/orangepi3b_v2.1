# Orange Pi 3B v2.1 (Rockchip RK3566) Resource & Knowledge Base

[![Board](https://img.shields.io/badge/Hardware-Orange%20Pi%203B%20v2.1-orange.svg)](http://www.orangepi.org/)
[![SoC](https://img.shields.io/badge/SoC-Rockchip%20RK3566-blue.svg)](https://www.rock-chips.com/)
[![NPU](https://img.shields.io/badge/NPU-RKNN%201.0%20TOPS-green.svg)](https://github.com/rockchip-linux/rknpu2)
[![GPU](https://img.shields.io/badge/GPU-Mali--G52%202EE-purple.svg)](https://gitlab.freedesktop.org/panfrost)

A curated repository of production-tested kernel builds, device tree overlays, hardware documentation, multimedia/NPU acceleration stacks, and practical tutorials for the **Orange Pi 3B v2.1** Single Board Computer.

---

## 📋 Hardware Specifications

| Subsystem | Specification |
| :--- | :--- |
| **Processor (SoC)** | Rockchip RK3566 (Quad-Core 64-bit ARM Cortex-A55 @ up to 1.8 GHz) |
| **Graphics (GPU)** | ARM Mali-G52-2EE (OpenGL ES 1.1/2.0/3.2, Vulkan 1.1, OpenCL 2.0) |
| **Neural Engine (NPU)** | Rockchip RKNN 1.0 TOPS @ INT8 (Supports TensorFlow, PyTorch, Caffe, ONNX) |
| **Video Engine (VPU)** | 4K@60fps H.265/H.264/VP9 decode, 1080p@60fps H.265/H.264 encode |
| **Storage & I/O** | M.2 M-Key NVMe SSD slot (PCIe 2.1 1-lane), eMMC socket, MicroSD card slot |
| **Networking** | Gigabit Ethernet (YT8531C PHY), Onboard Wi-Fi 5 + Bluetooth 5.0 (RTL8723D / AP6256) |

---

## 🗂️ Repository Architecture

The repository is modularized into 5 dedicated directories:

```text
orangepi3b_v2.1/
├── tutorials/       # Hardware setup, VPU/GPU acceleration & troubleshooting tutorials
├── kernels/         # Production kernels, DTB/DTS configurations & build VM recipes
├── hardware/        # Official schematics, pinouts, mechanical diagrams & peripheral drivers
├── apps/            # Edge AI applications (RKNN NPU OCR suite)
├── files_tools/     # Pre-compiled portable ARM64 tools, LibreOffice & QCAD packages
├── .gitignore       # Repository exclusion rules
└── README.md        # Master documentation (this file)
```

---

## 🚀 Navigation & Component Index

### 1. [Tutorials & Troubleshooting (`tutorials/`)](./tutorials/)
Comprehensive guides for tuning, configuring, and accelerating your board:
- [**Armbian Custom Build & DTB Update**](./tutorials/Armbian-Build_orangepi-3b-v2-dtb-update.md): Compile custom Armbian with patched v2.1 DTBs.
- [**Mali-G52 Panfrost GPU Benchmarking**](./tutorials/GPU_Benchmark.md): OpenGL ES 2.0/3.0 performance benchmarks.
- [**VPU Hardware Playback (MPV / FFplay)**](./tutorials/MPV_FFPLAY_VPU_Youtube.md): Rockchip VPU 4K decoding for local video and YouTube.
- [**Hardware Screen Recording (FFmpeg)**](./tutorials/ffmpeg_hwaccel_screen_recording.md): Screen recording with Rockchip MPP hardware encoding.
- [**TF Card to NVMe Migration**](./tutorials/Clone_TFcard_NVME.md): Safe migration of running OS installations to NVMe SSD.
- [**PWM Dynamic Fan Control**](./tutorials/OPi3b_Radxa3E_PWM.md): Configuring PWM thermal cooling curves.
- [**Booting v1.1 Images on v2.1**](./tutorials/OpPi3bv1.1_img_OPi3bv2.1.md): Resolving PMIC and DTB mismatches across board revisions.
- [**Ethernet PHY Troubleshooting**](./tutorials/Ethernet_Dead.md): Recovering from NIC sleep states and link drops.
- [**Samba NAS & Smooth Streaming**](./tutorials/SAMBA_NAS_Videos.md): Network share mounts and high-bitrate video playback.
- [**Boot Log Verbosity**](./tutorials/Boot_Log_Verbosity.md): Customizing serial console and kernel log output.
- [**Zenity GUI Reminders**](./tutorials/Scheduling_Zenity_GUI_popup.md): Timed desktop notification popups without cron.
- [**Essential Software & Extensions**](./tutorials/Must_Softwares.md): Recommended packages, codecs, and GNOME extensions.
- [**Replacing Huawei Cloud Mirrors**](./tutorials/Replace_Huawei_Ubuntu_Repos.md): Restoring standard Ubuntu ARM repositories.

---

### 2. [Kernels & Operating Systems (`kernels/`)](./kernels/)
Verified kernel releases, device trees, and build environments:
- [**Armbian Noble Kernel 6.1.75**](./kernels/Armbian_Noble_rk6.1.75/): Production DTB and DTS files for Ubuntu 24.04 (Noble) with v2.1 board support.
- [**MicroLinux Jammy Edge Kernel 6.6.4**](./kernels/MicroLinux_jammy_edge_6.6.4/): Mainline Linux 6.6.4 edge build with patched device trees.
- [**Build System VM Guide**](./kernels/Create_Build_System_VM/): Setting up a dedicated virtual machine for cross-compiling Armbian.

---

### 3. [Hardware & Peripherals (`hardware/`)](./hardware/)
Official engineering resources and peripheral firmware:
- [**Manuals & Schematics**](./hardware/manuals/): Official schematics (`OPi 3B V2.1_schematics.pdf`), GPIO pinout maps, PCB layout diagrams, and board wiki.
- [**Peripherals & Drivers**](./hardware/peripherals/): Realtek RTL8723D Wi-Fi/Bluetooth driver source, firmware archives, and `rtk_btusb` kernel module.

---

### 4. [Applications & AI Suites (`apps/`)](./apps/)
Edge AI applications:
- [**NPU OCR Suite (RKNN)**](./apps/NPU_OCR/): PaddleOCR pipeline accelerated via the 1.0 TOPS RKNN NPU with real-time hardware telemetry and Recoll desktop search integration.

---

### 5. [Portable Utilities & Prebuilts (`files_tools/`)](./files_tools/)
Pre-built portable ARM64 binaries, packages, and engineering tools:
- [**LibreOffice Engineering Extensions**](./files_tools/LibreOffice/): LibreBase SQLite3 ODBC connector, CoolProp thermodynamic tables, and nonlinear NLP solvers.
- [**QCAD 3.31.2 for ARM64**](./files_tools/QCAD_Compiling_Armbian_aarch64/): Full 2D CAD application compiled natively for 64-bit ARM Linux (multi-part 7z).
- **CLI & GUI Tools:** Includes `7z`, `advcpmv`, `cpdf`, `dumptorrent`, `geogebra5`, `jfilesync`, `lf`, `markpad`, `PdfMerger`, `pinta2.2.2_dotnet8`, `ripgrep-all`, `SQLiteStudio`, and overclocked DTB variants.

---

## 📜 License & Acknowledgments

- **Repository Maintainer:** Usama Khan ([cv.ukhan.org](https://cv.ukhan.org))
- **Hardware Vendor:** Xunlong Software Co., Ltd. (Orange Pi)
- **SoC Manufacturer:** Rockchip Electronics Co., Ltd.
