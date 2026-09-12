# Orange Pi 3B v2.1 Tutorials & Troubleshooting Guides

A categorized collection of hardware setup guides, system configuration walkthroughs, performance tuning, and troubleshooting notes for the **Orange Pi 3B v2.1** (Rockchip RK3566).

---

## 🛠️ System Administration & Boot Configuration

| Tutorial | Description |
| :--- | :--- |
| [**Armbian Build & DTB Update**](./Armbian-Build_orangepi-3b-v2-dtb-update.md) | Customizing and compiling Armbian Linux with updated v2.1 Device Tree Blobs. |
| [**Boot Log Verbosity**](./Boot_Log_Verbosity.md) | Adjusting console log levels in U-Boot and kernel command line via serial console. |
| [**TF Card to NVMe Migration**](./Clone_TFcard_NVME.md) | Step-by-step procedure for safely cloning a running microSD card installation onto NVMe SSD. |
| [**Booting v1.1 Images on v2.1**](./OpPi3bv1.1_img_OPi3bv2.1.md) | Resolving device tree and PMIC incompatibilities when booting older v1.1 OS images on v2.1 boards. |
| [**Replacing Huawei Cloud Mirrors**](./Replace_Huawei_Ubuntu_Repos.md) | Restoring official Ubuntu ARM ports repositories from customized vendor APT lists. |

---

## 🚀 Graphics, Video & Multimedia Acceleration

| Tutorial | Description |
| :--- | :--- |
| [**Mali-G52 Panfrost GPU Benchmarking**](./GPU_Benchmark.md) | Performance metrics and FPS benchmarks using glmark2-es2 and Panfrost open-source drivers. |
| [**VPU Hardware Playback (MPV / FFplay)**](./MPV_FFPLAY_VPU_Youtube.md) | Enabling Rockchip VPU hardware decoding for 1080p/4K local files and YouTube streams. |
| [**Hardware Screen Recording (FFmpeg)**](./ffmpeg_hwaccel_screen_recording.md) | Smooth desktop capture utilizing Rockchip MPP/RGA hardware encoding pipeline. |

---

## 🌐 Networking, Peripherals & Desktop Utilities

| Tutorial | Description |
| :--- | :--- |
| [**PWM Fan Control**](./OPi3b_Radxa3E_PWM.md) | Configuring dynamic thermal fan curves using hardware PWM on Orange Pi 3B / Radxa 3E. |
| [**Ethernet PHY Troubleshooting**](./Ethernet_Dead.md) | Diagnosing and recovering from Ethernet link down / PHY sleep state issues. |
| [**Samba NAS & Network Streaming**](./SAMBA_NAS_Videos.md) | Mounting remote Samba shares and enabling smooth streaming in media players without buffering. |
| [**Zenity GUI Reminders**](./Scheduling_Zenity_GUI_popup.md) | Triggering desktop popup reminders and notifications without relying on cron jobs. |
| [**Essential Software & Extensions**](./Must_Softwares.md) | Curated collection of essential desktop software, GNOME Shell extensions, and system packages. |
