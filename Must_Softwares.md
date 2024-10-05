## Tools to must install after drivers stuff...

## SAMBA support
`sudo apt install smbclient gvfs-backends cifs-utils`

## Hardware Identify
```
sudo apt install lshw
```

## Document PDF / WPS Office
`sudo apt install evince`

Download _wps-fonts_ & _wps-deb-arm64_ from `https://drive.google.com/drive/folders/18tMUqW30NvlFCZOJv0GV1G7ym4Pg39B3`
```
sudo apt install ./wps-office_11.1.0.11664_arm64.deb
unzip wps-fonts.zip
sudo mv *.ttf /usr/share/fonts/wps-office
sudo mv *.TTF /usr/share/fonts/wps-office
```
Further opimisation for WPS Office in this [github link](https://github.com/wachin/wps-office-all-mui-win-language)

## BOX86 & WINE7.xx
`https://github.com/neofeo/BOX86-BOX64-WINEx86-TUTORIAL`

## Terminal File Manager
download `lf` terminal filemanager `https://github.com/gokcehan/lf/releases` & _Midnight Commander_
```
tar -xvf lf-linux-amd64.tar.gz
sudo mv lf /usr/local/bin
sudo apt install mc
```
## Gnome Extensions 
```
sudo apt install gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager
```
[clipman-lite](https://github.com/popov895/clipman-lite)
[vitals](https://github.com/corecoding/Vitals)
[dash-to-dock](https://github.com/micheleg/dash-to-dock)
[workspaces-indicator](https://github.com/MichaelAquilina/improved-workspace-indicator)
[app-indicator](https://github.com/ubuntu/gnome-shell-extension-appindicator)

Use `dconf-editor` to disable animations in GNOME. Use _extension-manager_ GUI to install above extensions
## Text File Comparer
```
sudo apt install diff meld mousepad featherpad
```
## GPU / VPU Performance
Use `apt-cache policy ffmpeg mpv` to ensure they are installed from a [specific ppa](https://launchpad.net/~liujianfeng1994/+archive/ubuntu/rockchip-multimedia) [Configure media players](https://github.com/defencedog/orangepi3b_v2.1/blob/main/MPV_FFPLAY_VPU_Youtube.md) for HW accelerated video playback 

```
sudo apt install glmark2 glmark2-es2-wayland
```
## Education & Engineering
```
sudo apt install mono-complete python-is-python3 python3-pip
pip install coolprop ht fluids pyromat forallpeople handcalcs numpy sympy scipy matplotlib ipython jupyter --break-system-packages
```
Use custom builts for Geogebra 5 & [SMATH Studio Mono](https://smath.com/en-US/view/SMathStudio/download)
```
GeoGebra-Linux-Portable-5-2-857-0.7z
https://mega.nz/file/4yYF0ZZC#kyJ_LkrDCaoumNFatvDTyeSsTxjs1eY1P_gmEeHoEaA
```
Edit `geogebra5.desktop` to suite your file locations -> `Exec` & `Icon` entries
```
sudo cp geogebra5.desktop /usr/share/applications
```
For SMath use following for `smathstudio_desktop_mono`
```
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
cd "${HERE}"
export MONO_WINFORMS_XIM_STYLE=disabled
GTK2_RC_FILES=/usr/share/themes/Raleigh/gtk-2.0/gtkrc exec mono "${HERE}//Solver.exe" "$@"
```
See also [Libreoffice engineering](https://github.com/defencedog/orangepi3b_v2.1/tree/main/LibreOffice) extensions in this repo
