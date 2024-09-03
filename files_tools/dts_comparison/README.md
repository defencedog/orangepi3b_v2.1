# Combined experience with DTS files for different kernels

## rk3566-orangepi-3b-v2_jammy_5.1_official.dts
- From _Orangepi3b_1.0.6_ubuntu_jammy_desktop_xfce_linux5.10.160.img_
- All hardware components work
- WAYLAND _gnome-session_ **do not work** Seems they have blocked it somehow! Even if you install official _server.img_ & install `ubuntu-desktop` WAYLAND _gnome-session_ do not work

## rk3566-orangepi-3b-v2_jammy_6.6_official.dts
- From _Orangepi3b_1.0.6_ubuntu_jammy_desktop_gnome_linux6.6.0-rc5.img_
- RKNPU | WAYLAND _gnome-session_ **do not work** [Question / pastebin logs](https://askubuntu.com/questions/1525328/cannot-login-into-wayland-gnome-session-ubuntu-jammy-with-mali-gpu)
- KODI WAYLAND _gnome-session_ works
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

## Armbian_community_24.8.0-trunk.495_Orangepi3b_noble_edge_6.10.2_gnome.dts
- BT, RKNPU, Microphone **do not work**
- HDMI / 3.5mm audio out work
- `panfrost` under WAYLAND by default works
### Notes
I used `Armbian_community_24.8.0-trunk.495_Orangepi3b_noble_edge_6.10.2_gnome_desktop.img.xz` on my `OPi-3bv2.1` x2 hardware (BT & micrphone) didn't work. I editied current `dts` using `armbian-config` In `nano` from file start `Ctrl+6` then navigated to file end `Alt+/` then removed everything `Ctrl+K` & then inserted entire new `dts` (rk3566-orangepi-3b-v2_jammy_6.6_official.dts) using `Ctrl+R` rebooted & all hardware componenets were detected except RKNPU. however `wayland` was in _software rendering_ mode. `lsmod` do not have any entry of `panfrost` ... 
