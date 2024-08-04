## Official supported build OS by OrangePi
Download & install `ubuntu-22.04.4-live-server-amd64.iso` in Oracle VirtualBox

Minimum `.vdi` size must be `50gb` (this size is OK for making parallel x2 full OS images) & better it be on NVME or solid-state SSD

For network-interface use `Bridge` option

## Installation process of VM OS
Must enable auto-install of `Openssh`

Partition mounted at `/` to be ~`49gb`

## After VM OS is up & running
At this point you have to unmount `ubuntu-22.04.4-live-server-amd64.iso` & mount `VBoxGuestAdditions.iso` usually located in `c:\Program Files\Oracle\VirtualBox\`. For this process you have to use Virtualbox GUI 

```
sudo apt update
sudo apt upgrade
sudo apt install build-essential  gcc-11-aarch64-linux-gnu -y
```
Install VirtualBox Guest Additions on a GUI-less Ubuntu server host
Mount the CD-ROM with the command 
```
sudo mkdir  /media/cdrom
sudo mount /dev/cdrom /media/cdrom
```
Change into the mounted directory with the command `cd /media/cdrom`
Install the necessary dependencies with the command 

`sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)`

Change to the root user with the command `sudo su`
Install the Guest Additions package with the command `./VBoxLinuxAdditions.run`
Allow the installation to complete & `sudo reboot`
