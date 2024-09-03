# Combined experience with DTS files for different kernels

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
- BT / WIFI works
a slight modification for BT
```
sudo nano /boot/orangepiEnv.txt
#before overlay_prefix line add this line
fdtfile=rockchip/rk3566-orangepi-3b-v2.dtb
```
