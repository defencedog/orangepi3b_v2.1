# Complete image for OPi3b v2.1
Hurray! All hardrware components / features are running except RKNPU. This build uses bleeding edge mesa graphics that are extremely latest!

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
