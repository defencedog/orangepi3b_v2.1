## Cloning TFcard to NVME with all settings / installed apps

While system is running on SBC, identify installed nvme
```
$ sudo fdisk -l | grep "nvme0n1"
Disk /dev/nvme0n1: 1.86 TiB, 2048408248320 bytes, 4000797360 sectors
```
Download and install the **arm64** version of balenaEtcher
```
wget https://github.com/Itai-Nelken/BalenaEtcher-arm/releases/download/v1.7.9/balena-etcher-electron_1.7.9+5945ab1f_arm64.deb
sudo apt install -y --fix-broken ./balena-etcher-electron_1.7.9+5945ab1f_arm64.deb
```
