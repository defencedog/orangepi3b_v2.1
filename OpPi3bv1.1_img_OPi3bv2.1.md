# Armbian GNOME Wayland on OPi3bv2.1

The following files are located in the mega.nz link
```
Armbian-unofficial_24.8.0-trunk_Orangepi3b_jammy_legacy_5.10.160_gnome_desktop.img.xz
linux-image-legacy-rockchip-rk356x_1.0.6_arm64_china.deb
linux-dtb-legacy-rockchip-rk356x_1.0.6_arm64.deb
linux-headers-legacy-rockchip-rk356x_1.0.6_arm64.deb
linux-u-boot-legacy-orangepi3b_1.0.6_arm64.deb
```
Wifi/BT of of v1.1 will not work & all modules related to it must be blacklisted & disabled. These modules start with name `sprd*`
`sudo nano /etc/modules` comment out all `sprd*` entries by adding `#` in the beginning
