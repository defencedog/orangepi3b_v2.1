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
sudo apt install bsdmainutils
sudo dpkg -i wps-office_11.1.0.11664_arm64.deb
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
sudo apt install gnome-tweaks gnome-shell-extensions chrome-gnome-shell
```

## Text File Comparer
```
sudo apt install diff meld
```
