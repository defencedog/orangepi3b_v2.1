# Armbian GNOME Wayland on OPi3bv2.1

The following files are located in the mega.nz link
```
Armbian-unofficial_24.8.0-trunk_Orangepi3b_jammy_legacy_5.10.160_gnome_desktop.img.xz
linux-image-legacy-rockchip-rk356x_1.0.6_arm64_china.deb
linux-dtb-legacy-rockchip-rk356x_1.0.6_arm64.deb
linux-headers-legacy-rockchip-rk356x_1.0.6_arm64.deb
linux-u-boot-legacy-orangepi3b_1.0.6_arm64.deb
```
### Whole procedure to be done without any reboot
Load correct `dtb` file by `sudo nano /boot/armbianEnv.txt` & this is the correct line `fdtfile=rockchip/rk3566-orangepi-3b-v2.dtb`
Wifi/BT of of v1.1 will not work & all modules related to it must be blacklisted & disabled. These modules start with name `sprd*`
`sudo nano /etc/modules` comment out all `sprd*` entries by adding `#` in the beginning
Create a new file `sudo nano /etc/modprobe.d/blacklist-orangepi3b.conf` or edit if already existing. 
Contents to be as follows
```
#blacklist bcmdhd
blacklist sprdwl_ng
blacklist sprdbt_tty
```
If there are multiple `.conf` files use `cat *` to investigate all file contents
Remove invalid services for BT 
```
sudo systemctl disable sprd-bluetooth.service
sudo apt purge snapd #optional
```
Install kernel headers & prerequisites
```
sudo apt update
sudo apt install libssl-dev python-is-python3
sudo apt install ./linux-headers-legacy-rockchip-rk356x_1.0.6_arm64.deb
```
above will auto run `sudo update-initramfs -u` 
