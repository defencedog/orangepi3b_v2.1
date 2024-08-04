## Official supported build OS by OrangePi
Download & install `ubuntu-22.04.4-live-server-amd64.iso` in Oracle VirtualBox

Minimum `.vdi` size must be `50gb` (this size is OK for making parallel x2 full OS images) & better it be on NVME or solid-state SSD

For network-interface use `Bridge` option

## Installation process of VM OS
Must enable auto-install of `Openssh`

Partition mounted at `/` to be ~`49gb`

## SSH into VM OS
If you have setup network-interface option `Bridge` you can see that VM OS is on *LAN* by typing `ip a` the `ip` address will be on *same series* as your HOST OS. Use standard `cmd` or `powershell` to interface with VM OS using `ssh <username>@ip`

## After VM OS is up & running
At this point you have to unmount `ubuntu-22.04.4-live-server-amd64.iso` & mount `VBoxGuestAdditions.iso` usually located in `c:\Program Files\Oracle\VirtualBox\`. For this process you have to use Virtualbox GUI 

```
sudo apt update
sudo apt upgrade
sudo apt install build-essential  gcc-11-aarch64-linux-gnu libgmp3-dev libmpc-dev -y
```
Install VirtualBox Guest Additions on a GUI-less Ubuntu server host
Mount the CD-ROM with the command 
```
sudo mkdir  /media/cdrom
sudo mount /dev/cdrom /media/cdrom
```
Change into the mounted directory with the command `cd /media/cdrom`
Install the necessary dependencies with the command 

`sudo apt install -y dkms linux-headers-generic linux-headers-$(uname -r)`

Change to the root user with the command `sudo su`
Install the Guest Additions package with the command `./VBoxLinuxAdditions.run`
Allow the installation to complete & `sudo reboot`

After reboot if above step is successfull following output must happen
```
$modinfo vboxguest
filename:       /lib/modules/5.15.0-117-generic/misc/vboxguest.ko
version:        7.0.4 r154605
license:        GPL
description:    Oracle VM VirtualBox Guest Additions for Linux Module
author:         Oracle and/or its affiliates
srcversion:     4F45A0842FDEE40E95D4CE2
alias:          pci:v000080EEd0000CAFEsv00000000sd00000000bc*sc*i*
depends:
retpoline:      Y
name:           vboxguest
vermagic:       5.15.0-117-generic SMP mod_unload modversions
```
