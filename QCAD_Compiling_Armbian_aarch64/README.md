# Compiling QCAD within Armbian

Just use `qmake` tools from repository instead of compiling yourself

## Host machine
```
OS: Armbian 24.11.2 noble aarch64 
Host: Rockchip RK3566 OPi 3B 
Kernel: 6.1.75-vendor-rk35xx 
Uptime: 5 mins 
Packages: 2194 (dpkg) 
Shell: bash 5.2.21 
Resolution: 1920x1080 
DE: GNOME 46.0 
WM: Mutter 
WM Theme: Adwaita 
Theme: Adwaita [GTK2/3] 
Icons: Numix-Circle [GTK2/3] 
Terminal: gnome-terminal 
CPU: (4) @ 1.800GHz 
Memory: 1451MiB / 3919MiB 
```

## Prerequisites

In the [official link](https://www.qcad.org/en/component/content/article/78-qcad/111-qcad-compilation-from-sources) `aarch64` is not mentioned the prerequisites are for `x86` platforms; luckily many packages mentioned under _Debian_ are officially available in _Ubuntu_ repos

> Check that you have the following (including dependencies) installed:
> 
> gcc
> 
> make
> 
> libx11-dev
> 
> libxext-dev
> 
> libxrender-dev
> 
> Ubuntu:
> 
> libglu1-mesa-dev libfreetype6-dev libfontconfig1-dev libssl-dev libdbus-1-dev libsm-dev
> 
> Debian:
> 
> libglu1-mesa-dev libfreetype6-dev libfontconfig1-dev libssl-dev libdbus-1-dev libsm-dev gcc make libx11-dev libxext-dev libxrender-dev libglu1-mesa-dev libfreetype6-dev libfontconfig1-dev libssl-dev libdbus-1-dev libsm-dev qt5-qmake qt5-default libqt5svg5-dev libqt5script5 libqt5help5 libqt5designer5 libqt5scripttools5 qtscript5-dev qtxmlpatterns5-dev-tools libqt5xmlpatterns5 libqt5xmlpatterns5-dev libqt5designer5 python3-pyside2.qtuitools libqscintilla2-qt5-designer libqt5designer5 qttools5-dev qt5-image-formats-plugins qtwayland5 qtwayland5-dev-tools libqt5waylandclient5

Packages I installed:

```
sudo apt install libqt5opengl5-dev libqt5opengl5t64 qtscript5-dev libqt5designer5 qttools5-dev qtwayland5 qtwayland5-dev-tools qt5-image-formats-plugins qt5-qmake qtbase5-dev qtbase5-dev-tools libqt5svg5-dev libqt5webenginewidgets5 libqt5webchannel5-dev qtwebengine5-dev libglu1-mesa-dev libfreetype6-dev libfontconfig1-dev libssl-dev libdbus-1-dev libsm-dev libqt5script5 libqt5script5 libqt5concurrent5t64
```
