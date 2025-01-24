# Compiling QCAD within Armbian Wayland

<img src=QCAD_COMPILED_About.png width="300" />

Just use `qmake` tools from repository instead of compiling yourself. Compiling under RK3566 took ~11 hours. Be patient

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

It must be noticed that I installed many packages listed under _Debian_ in order for successful compile. Packages I installed:

```
sudo apt install libqt5opengl5-dev libqt5opengl5t64 qtscript5-dev libqt5designer5 qttools5-dev qtwayland5 qtwayland5-dev-tools qt5-image-formats-plugins qt5-qmake qtbase5-dev qtbase5-dev-tools libqt5svg5-dev libqt5webenginewidgets5 libqt5webchannel5-dev qtwebengine5-dev libglu1-mesa-dev libfreetype6-dev libfontconfig1-dev libssl-dev libdbus-1-dev libsm-dev libqt5script5 libqt5script5 libqt5concurrent5t64
```
## Modifying source code
Downloading QCAD source
```
wget https://github.com/qcad/qcad/archive/v3.31.2.0.zip
unzip v3.31.2.0.zip
cd qcad-3.31.2.0/
```
Check your `qmake` version
```
$ qmake -v
QMake version 3.1
Using Qt version 5.15.13 in /usr/lib/aarch64-linux-gnu
```
Modifications as follows are needed because compile projects located at `qcad-3.31.2.0/src/3rdparty` may not include QT that Armbian uses. In this location there will be many folders each having one _project_ file for each respective QT version. Contents of file are same for 5.xx
```
cd qcad-3.31.2.0/src/3rdparty
mv qt-labs-qtscriptgenerator-5.15.8 qt-labs-qtscriptgenerator-5.15.13 #folder rename matching your qmake version
cd qt-labs-qtscriptgenerator-5.15.13
mv qt-labs-qtscriptgenerator-5.15.8.pro qt-labs-qtscriptgenerator-5.15.13.pro #file rename matching your qmake version
```

## Configure & Compile QCAD

Under `wayland` I got `egl` related error while launching QCAD. Resolved via prepending `QT_QPA_PLATFORM=xcb` as [instructed here](https://github.com/flathub/net.sourceforge.Chessx/issues/5#issuecomment-568793891)
```
cd qcad-3.31.2.0/
qmake -r CONFIG+=ractivated
make release
cd release
QT_QPA_PLATFORM=xcb LD_LIBRARY_PATH=. ./qcad-bin
```
## Precompiled 7z archive

You can downloac x4 parts & extract these. For ease of use you can do following steps which will give you a nicer way to launch / integrate QCAD with Armbian GNOME

After creating / editing each file do `chmod +x launcher.sh` & `chmod +x qcad.desktop`

_launcher.sh_ (your locations may change)
```
cd /home/ukhan/Binaries/qcad-3.31.2.0_aarch64/release
QT_QPA_PLATFORM=xcb LD_LIBRARY_PATH=. ./qcad-bin
```
_qcad.desktop_ in `~/.local/share/applications` (your `Icon` location will change, also better to make `Terminal=true` for debugging)
```
[Desktop Entry]
Name=QCAD
GenericName=CAD Software
Comment[en]=System 2D CAD
Exec=qcad %F
X-MultipleArgs=true
Icon=/home/ukhan/Binaries/qcad-3.31.2.0_aarch64/scripts/qcad_icon.svg
Terminal=false
Type=Application
Categories=Graphics;VectorGraphics;Engineering;Construction;2DGraphics;Science;
MimeType=application/dxf;image/vnd.dxf;
StartupNotify=true
```
