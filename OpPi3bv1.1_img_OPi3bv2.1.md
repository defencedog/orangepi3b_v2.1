# Armbian GNOME Wayland on OPi3bv2.1
Download only `.img.xz` on external PC & burn the image on an sdcard & then download all other files on SBC
The following files are located in the mega.nz link
```
Armbian-unofficial_24.8.0-trunk_Orangepi3b_jammy_legacy_5.10.160_gnome_desktop.img.xz
https://mega.nz/file/BrQjiDzS#EYy_wzhkyZmt1GO6odsiVWEidPBBG6OvVpypUr6t3BY
linux-image-legacy-rockchip-rk356x_1.0.6_arm64_china.deb
https://mega.nz/file/hyoSRbSb#JVlCPjYhWgrWDu0gUVqdMHQD8fxJoKWn85iVLtEPwTE
linux-dtb-legacy-rockchip-rk356x_1.0.6_arm64.deb
https://mega.nz/file/J75HCDTQ#TiJxVCGfIPoS_hIWJoCzpgeKveFz70Gar8n9XHU1-hI
linux-headers-legacy-rockchip-rk356x_1.0.6_arm64.deb
https://mega.nz/file/ZnxE3TjS#hJ_fKoBk9pIiod3r-rclfGVb7JB10Jhgzcv_cu-i0v0
linux-u-boot-legacy-orangepi3b_1.0.6_arm64.deb
https://mega.nz/file/srhyBAwL#sY_qXSP3gTtELTpeKcTah0CZbqFeC92xP-etyNtxWxE
brcm-patchram-plus_0.1.1.tar.gz
https://mega.nz/file/giZ2QCoJ#a6EmzE3vgoyvDGtJtjY4DS9UsfMgzQ4oln2ylYN0XqE
```
As per [kernel.org](https://lore.kernel.org/linux-kernel/0318fc56-789c-47fd-8f28-1ddf1ebc1cf3@kernel.org/T/#ef90ef4d64642d5251753347cd93f7fdd22999a5f) following are changes to SBC at hardware level
```
Changes in v2:
- Add DT for v2.1 hw revision, rename initial DT to v1.1:
  - Ethernet phy io voltage: 3v3 (v1.1) / 1v8 (v2.1)
  - Etherent reset gpios: GPIO3_C2 (v1.1) / GPIO4_C4 (v2.1)
  - WiFi/BT: CDW-20U5622 (v1.1) / AP6256 (v2.1)
- Rename led node and move led pinctrl props
- Use regulator-.* nodename for fixed regulators
- Drop rockchip,mic-in-differential prop
- Add cap-mmc-highspeed to sdhci node
- Add no-mmc and no-sd to sdmmc1 node
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
sudo apt install libssl-dev python-is-python3 lshw
sudo apt install ./linux-headers-legacy-rockchip-rk356x_1.0.6_arm64.deb
```
above will auto run `sudo update-initramfs -u` & there can be some _missing firmware_ errors but these are not important as those devices are not on SBC

Now finally reboot `sudo reboot`

## Checking for WIFI & further working
Following are extracts from full output of `sudo lshw`
```
  *-mmc2
       description: MMC Host
       physical id: 9
       logical name: mmc2
     *-device
          description: SDIO Device
          physical id: 1
          bus info: mmc@2:0001
          serial: 0
          capabilities: sdio
        *-interface:0
             product: 43455
             vendor: Broadcom
             physical id: 1
             bus info: mmc@2:0001:1
             logical name: mmc2:0001:1
        *-interface:1
             product: 43455
             vendor: Broadcom
             physical id: 2
             bus info: mmc@2:0001:2
             logical name: mmc2:0001:2
        *-bt
             description: BlueTooth interface
             product: 43455
             vendor: Broadcom
             physical id: 3
             bus info: mmc@2:0001:3
             logical name: mmc2:0001:3
             capabilities: wireless bluetooth
             configuration: wireless=BlueTooth
 
  *-network:1
       description: Wireless interface
       physical id: 11
       logical name: wlan0
       serial: 54:78:c9:0e:17:ae
       capabilities: ethernet physical wireless
       configuration: broadcast=yes driver=wl driverversion=0 ip=192.168.1.23 multicast=yes wireless=IEEE 802.11

```
So wifi is using Broadcom's `wl` driver popular in Debian distros. While `bt` is detected at hardware level but is not working!

`hciconfig` command returns nothing meaning there is no BT controller available to OS

`AP6256` module BT firmware are discussed at [SUNXI-OrangePI_3](https://linux-sunxi.org/Xunlong_Orange_Pi_3#Firmware_files)
```
For WiFi, you'll need a fw_bcm43456c5_ag.bin firmware file and nvram.txt configuration that can be found in the Xulongs's repository for H6:

https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256
Mainline brcmfmac driver expects the firmware and nvram at the following paths relative to the firmware directory:

brcm/brcmfmac43456-sdio.bin
brcm/brcmfmac43456-sdio.txt
For Bluetooth 5.0, you'll need a BCM4345C5.hcd firmware file that can be found in the Xulongs's repository for H6:

https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256
The driver expects the firmware at the following path relative to the firmware directory:

brcm/BCM4345C5.hcd
```
Luckily the Armbian included firmware already have required file `/lib/firmware/BCM4345C5.hcd`

This tutorial at [sunplus.atlassian.net](https://sunplus.atlassian.net/wiki/spaces/doc/pages/547848193/Install+Sunplus+WiFi+BT+module+AP6256+on+SP7021+demo+board+V3) defines procedure to initiate _gpio_ attached BT `AP6256` module. It indicates an `exec` file needed for process named `brcm_patchram_plus` also it shows that _serial port_ address is needed where module is physically attached to SBC e.g `/dev/ttyS4`

## Enabling Bluetooth
In the above links `brcm-patchram-plus_0.1.1.tar.gz` file contains a single `.c` file which must be compiled using SBC compilers
```
tar -xvf brcm-patchram-plus_0.1.1.tar.gz
cd brcm-patchram-plus_0.1.1
gcc brcm_patchram_plus.c -o brcm_patchram_plus
sudo mv brcm_patchram_plus /usr/bin
```
Now we need an autorun service, located here at [github.orangepi-xunlong](https://github.com/orangepi-xunlong/orangepi-build/tree/55155f1d73cca3cf6bf42a03d7d16df2b14e8014/external/packages/bsp/sunxi)
```
cd /lib/systemd/system/
sudo wget -O https://raw.githubusercontent.com/orangepi-xunlong/orangepi-build/55155f1d73cca3cf6bf42a03d7d16df2b14e8014/external/packages/bsp/sunxi/ap6256-bluetooth.service
sudo systemctl enable ap6256-bluetooth.service
```
Observe this line
```
ExecStart=/usr/bin/brcm_patchram_plus -d --enable_hci --no2bytes --tosleep 200000 --baudrate 1500000 --patchram /lib/firmware/BCM4345C5.hcd /dev/ttyS1
```
You have the `brcm_patchram_plus` file in `/usr/bin` you have firmware `/lib/firmware/BCM4345C5.hcd`

Ensure this _serial port_ address `/dev/ttyS1` is available
```
~$ ls /dev
ashmem           full         iio:device0   mmcblk1      rga      tty11  tty27  tty42  tty58     vcs    vcsu1
autofs           fuse         initctl       mmcblk1p1    rk_cec   tty12  tty28  tty43  tty59     vcs1   vcsu2
block            gpiochip0    input         mpp_service  rtc      tty13  tty29  tty44  tty6      vcs2   vcsu3
bsg              gpiochip1    kmsg          mqueue       rtc0     tty14  tty3   tty45  tty60     vcs3   vcsu4
btrfs-control    gpiochip2    kvm           mtd0         sda      tty15  tty30  tty46  tty61     vcs4   vcsu5
bus              gpiochip3    log           mtd0ro       sda1     tty16  tty31  tty47  tty62     vcs5   vcsu6
cec0             gpiochip4    loop0         mtdblock0    sg0      tty17  tty32  tty48  tty63     vcs6   vcsu7
char             gpiochip5    loop1         net          shm      tty18  tty33  tty49  tty7      vcs7   vhci
console          hdmi_hdcp1x  loop2         null         snd      tty19  tty34  tty5   tty8      vcsa   video-dec0
cpu_dma_latency  hidraw0      loop3         port         stderr   tty2   tty35  tty50  tty9      vcsa1  video-enc0
crypto           hidraw1      loop4         ppp          stdin    tty20  tty36  tty51  ttyFIQ0   vcsa2  watchdog
cuse             hidraw2      loop5         ptmx         stdout   tty21  tty37  tty52  ttyS1     vcsa3  watchdog0
disk             hugepages    loop6         ptp0         sw_sync  tty22  tty38  tty53  ubi_ctrl  vcsa4  zero
dma_heap         hwrng        loop7         pts          tty      tty23  tty39  tty54  uhid      vcsa5  zram0
dri              i2c-0        loop-control  ram0         tty0     tty24  tty4   tty55  uinput    vcsa6  zram1
fb0              i2c-1        mapper        random       tty1     tty25  tty40  tty56  urandom   vcsa7
fd               i2c-6        mem           rfkill       tty10    tty26  tty41  tty57  usb       vcsu
```

If you observe github contents there is also a file `ap6256-wifi.service` but I have not used it because even without it my wifi is attached to _5G_ network

Now finally reboot `sudo reboot`. After reboot this should be available
```
$ hciconfig
hci0:   Type: Primary  Bus: UART
        BD Address: 54:78:C9:0E:17:AF  ACL MTU: 1021:8  SCO MTU: 64:1
        UP RUNNING PSCAN ISCAN
        RX bytes:969 acl:0 sco:0 events:75 errors:0
        TX bytes:5526 acl:0 sco:0 commands:75 errors:0

```
