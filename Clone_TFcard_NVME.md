## Cloning TFcard to NVME with all settings / installed apps

While system is running on SBC, identify installed nvme
```
$ sudo fdisk -l | grep "nvme0n1"
Disk /dev/nvme0n1: 1.86 TiB, 2048408248320 bytes, 4000797360 sectors
```
Download and install the **arm64** version of balenaEtcher
```
wget https://github.com/Itai-Nelken/BalenaEtcher-arm/releases/download/v1.7.9/balena-etcher-electron_1.7.9+5945ab1f_arm64.deb
sudo apt install -y --fix-broken ./balena-etcher-electron_1.7.9+5945ab1f_arm64.deb #it may try & download from official ubuntu ppa
```
## Burning OS
This method is equivalent to cloning the system in the TF card to the NVMe SSD
1. First click Clone drive
2. Then select the device name of the TF card `/dev/mmcblk1`
3. Then click Select target
4. Then click Show 2 hidden to open more options for storage devices
5. Then select the device name of the NVMe SSD `/dev/nvme0n1`, and click Select
6. Then click Flash

## Resizing NVME to full space
We need to expand the capacity of the rootfs partition in the NVMe SSD
1. Install `sudo apt-get install -y gparted`
2. Then select NVMe SSD (top right corner drop-down list)
3. Then select the `/dev/nvme0n1p2` partition, click the right button again, and then select Resize/Move
4. Then drag the capacity to the maximum at the position
5. `Free space following (MiB)` will be `0`
6. Then click Apply (green √)
