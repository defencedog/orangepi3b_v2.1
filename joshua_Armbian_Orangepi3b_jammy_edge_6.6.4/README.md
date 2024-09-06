# Complete image for OPi3b v2.1
Hurray! All hardrware components / features are running except RKNPU. This build uses bleeding edge mesa graphics that are extremely latest!
```
Armbian-unofficial_24.2.0-trunk_Orangepi3b_jammy_edge_6.6.4_gnome_desktop.img.xz
https://mega.nz/file/Fr4jGQJQ#jbpYkXb9HcIAkcS9lpKs1iIvYDGpuLw-UQjIkvWjAAU
OS: Armbian (24.2.0-trunk) aarch64
Host: Rockchip RK3566 OPi 3B
Kernel: 6.6.4-edge-rockchip64
Uptime: 6 mins
Packages: 1625 (dpkg)
Shell: bash 5.1.16
Resolution: 1920x1080
Terminal: /dev/ttyS2
CPU: (4) @ 1.800GHz
Memory: 711MiB / 3672MiB
```

## Be cautious on first boot! Don't blindly update && upgrade
There is a buggy _mesa_ graphic driver repo that needs to be disabled. Otherwise on next boot WAYLAND will run in software rendering `llvmpipe` mode. We also need to change upgrade priorities
```
cd /etc/apt/sources.list.d/
sudo mv oibaf.list oibaf.list.disabled
cd /etc/apt/preferences.d
sudo nano orangepi3b #name of file unimporatant 
```
add following to file
```
Package: *
Pin: release o=LP-PPA-liujianfeng1994-mainline-vpu
Pin-Priority: 1000

Package: *
Pin: release o=LP-PPA-liujianfeng1994-ubuntu-chromium
Pin-Priority: 1000
```
After a reboot run `sudo apt update && sudo apt upgrade -y` & again reboot. 

## Adding missing Hardware support
As you can see every piece of hardware is workign except BT so we will unload unnecessary _sprd*_ modules & add what are required to load BT. Plus we need to do some `dts` modification & additional `overlays` are to be provided to kernel at boot time
### Kernel modules modification
```
sudo systemctl stop sprd-bluetooth
sudo systemctl disable sprd-bluetooth
sudo nano /etc/modules
```
file contents are like
```
#sprdbt_tty
#sprdwl_ng
```
then reboot. Now if you check `lsmod` no modules with _sprd*_ are loaded. Now search for necessary Broadcom BT module. I used [OrangePi_Official_6.6.img](https://mega.nz/file/pnIT3CiZ#zVYLAZIvsKRiOaQRNwbW2WhOWLj-SKQ4aSL9SP5T680) to know necessary module names.

```
cd /lib/modules/6.6.4-edge-rockchip64/kernel/
find -iname *btbcm* #module location
sudo insmod ./drivers/bluetooth/btbcm.ko
sudo nano /etc/modules
```
file contents are like
```
#sprdbt_tty
#sprdwl_ng
btbcm
```
then do `sudo update-initramfs -u` & reboot
### DTB modification & Overlay addition
Download the _dtb.tar.gz_ file included in this repo. These dtb (included dts / overlays) are extracted from official OrangePi3b v2.1 build under Kernel6.6 using official OrangePi procedure
```
tar -xvf dtb.tar.gz
cd dtb/rockchip
cp rk3566-orangepi-3b-v2_jammy_6.6_official.dts ~/
sudo cp -R overlay/ /boot/dtb/rockchip/
sudo nano /boot/armbianEnv.txt
```
File conetents, see the new line _overlays_ you can also use `armbian-config` to enable it 
```
verbosity=1
bootlogo=true
overlay_prefix=rk356x
overlays=gpu
fdtfile=rockchip/rk3566-orangepi-3b.dtb
rootdev=UUID=346f5f72-2605-4cdd-a025-6589741fe0a5
rootfstype=ext4
usbstoragequirks=0x2537:0x1066:u,0x2537:0x1068:u
```

Then `sudo armbian-config` System -> DTC

This will open a `nano` text editor. From the start of file press `Ctrl+6` then go to file end using `Alt+/` then cut whole file contents using `Ctrl+K`. Now insert new file in it using `Ctrl+R` then typing `/home/<user>/rk3566-orangepi-3b-v2_jammy_6.6_official.dts`. Finally `Ctrl+O` to save file & `Ctrl+X` to exit nano. Say `y` to replace existing `dtb` & `y` for a reboot. 

### Tips
Use `glxinfo -B` to be sure WAYLAND is using `panfrost`

I have to install media player `celluloid` so I have to do some modification
```
cd /etc/apt/sources.list.d/
sudo mv oibaf.list.disabled oibaf.list
sudo apt update
sudo apt install celluloid -y
sudo mv oibaf.list oibaf.list.disabled
```
