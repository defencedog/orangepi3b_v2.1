# Combined experience with DTS files of OPi3b v2.1 for different kernels

## Armbian-unofficial_24.8.0-trunk_Orangepi3b_jammy_legacy_5.10.160_gnome.dts
- Tutorial / links to **most usable** image [here on github](https://github.com/defencedog/orangepi3b_v2.1/blob/main/OpPi3bv1.1_img_OPi3bv2.1.md)
- USB2.0 that is under USB 3.0 is **not working** ... will not work on it for now
- Audio HDMI works; but headset 3.5mm jack **does not** ... a disappointment
- All other hardware components work | RKNPU, `panfrost` WAYLAND, BT, WIFI, GPU, VPU (under `chrome` from [ppa:liujianfeng1994](https://github.com/defencedog/orangepi3b_v2.1/tree/main/Orangepi-3B%20rk3566-5.10.160-panfrost#gpu-vpu-aceeleration))

## rk3566-orangepi-3b-v2_jammy_5.1_official.dts
- From [Orangepi3b_1.0.6_ubuntu_jammy_desktop_xfce_linux5.10.160.img](https://mega.nz/file/pioTXYDT#Utb--F3GsHjvvmecNCibHg9fxmpbDZNHvFzAEY-8PtQ)
- All hardware components work
- WAYLAND _gnome-session_ **do not work** Seems they have blocked it somehow! Even if you install official _server.img_ & install `ubuntu-desktop` WAYLAND _gnome-session_ do not work

## rk3566-orangepi-3b-v2_jammy_6.6_official.dts
- From [Orangepi3b_1.0.6_ubuntu_jammy_desktop_gnome_linux6.6.0-rc5.img](https://mega.nz/file/pnIT3CiZ#zVYLAZIvsKRiOaQRNwbW2WhOWLj-SKQ4aSL9SP5T680)
- RKNPU | WAYLAND _gnome-session_ **do not work** [Question / pastebin logs](https://askubuntu.com/questions/1525328/cannot-login-into-wayland-gnome-session-ubuntu-jammy-with-mali-gpu)
- For `chrome` being installed using [ppa:liujianfeng1994](https://github.com/defencedog/orangepi3b_v2.1/tree/main/Orangepi-3B%20rk3566-5.10.160-panfrost#gpu-vpu-aceeleration) GPU acceleration works, VPU **do not work**
- KODI WAYLAND _gnome-session_ works, detects GBM as windowing system, HDR available is reported
- HDMI / 3.5mm audio out works, microphone works
- `panfrost` modules loads & is available in `glxinfo -B`
```
sudo orangepi-config
#Go to System -> Hardware and enable the GPU & Reboot
```
- BT / WIFI works after a slight modification
```
sudo nano /boot/orangepiEnv.txt
#before overlay_prefix line add this line
fdtfile=rockchip/rk3566-orangepi-3b-v2.dtb
```
### Notes
Audio is working at `gdm3` but once you login after some seconds no sound devices are available though `aplay -l` corretly identifies audio sinks & sources. This software bug is [mentioned here](https://askubuntu.com/questions/132577/no-sound-in-ubuntu-except-at-log-in). Use this to [solve it](https://askubuntu.com/a/195195/110979) 
```
killall pulseaudio
sudo gpasswd -a <yourusername> audio
pulseaudio -D
```

## Armbian_community_24.8.0-trunk.495_Orangepi3b_noble_edge_6.10.2_gnome.dts
- BT, RKNPU, Microphone **do not work**
- HDMI / 3.5mm audio out work
- KODI detects WAYLAND as windowing system, HDR **not available**
- `panfrost` under WAYLAND by default works
### Notes
I used `Armbian_community_24.8.0-trunk.495_Orangepi3b_noble_edge_6.10.2_gnome_desktop.img.xz` on my `OPi-3bv2.1` x2 hardware (BT & micrphone) didn't work. I editied current `dts` using `armbian-config` In `nano` from file start `Ctrl+6` then navigated to file end `Alt+/` then removed everything `Ctrl+K` & then inserted entire new `dts` (rk3566-orangepi-3b-v2_jammy_6.6_official.dts) using `Ctrl+R` rebooted & all hardware componenets were detected except RKNPU. however `wayland` was in _software rendering_ mode. `lsmod` do not have any entry of `panfrost` ... 

## Joshua_Armbian-unofficial_24.2.0-trunk_Orangepi3b_jammy_edge_6.6.4_gnome.dts
- Image is made by Joshua-Riek available on [mega.nz](https://mega.nz/file/Fr4jGQJQ#jbpYkXb9HcIAkcS9lpKs1iIvYDGpuLw-UQjIkvWjAAU)
- BT, RKNPU **do not work**
- Audio HDMI / 3.5mm jack works; microphone works
- `panfrost` under WAYLAND by default works
### Notes
After `spt upgrade` WAYLAND stopped using `panfrost` instead used `llvmpipe` thus `glmark2-es2-wayland` score 25 is very poor. To avoid this `sudo mv /etc/apt/sources.list.d/oibaf.list /etc/apt/sources.list.d/oibaf.list.disabled` then `glmark2-es2-wayland` score 481
