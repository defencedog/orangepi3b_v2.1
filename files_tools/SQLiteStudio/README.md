## Host Machine
Took ~2.5 hours to compile & packing a portable version

```
OS: Armbian 24.11.3 noble aarch64 
Host: Rockchip RK3566 OPi 3B 
Kernel: 6.1.75-vendor-rk35xx 
Uptime: 7 hours, 2 mins 
Packages: 2239 (dpkg) 
Shell: bash 5.2.21 
Resolution: 1920x1080 
DE: GNOME 46.0 
WM: Mutter 
WM Theme: Adwaita 
Theme: Adwaita [GTK2/3] 
Icons: Numix-Circle [GTK2/3] 
Terminal: gnome-terminal 
CPU: (4) @ 1.800GHz 
Memory: 1714MiB / 3919MiB 
```

## Dependencies
`sudo apt install -y qttools5-dev chrpath tcl-dev qttools5-dev-tools libreadline-dev`

## Build Instructions
[Official Link](https://github.com/pawelsalawa/sqlitestudio/wiki/Instructions_for_compilation_under_Linux)
> Automatic compilation (recommended)

## Ease of Access
Download & place `launch.sh` in the SQLiteStudio folder. Do following to launch application from anywhere via terminal or make a desktop shortcut
```
chmod +x launch.sh
sudo ln -s <full-path>/launch.sh /usr/local/bin/sqlitestudio # use pwd to get full absolute path
nano /usr/local/share/applications/sqlitestudio.dekstop
```
contents of `.desktop` file; change `Icon` location
```
[Desktop Entry]
Name=SQLite Studio
Comment=Studio for SQLite is a light GUI editor for SQLite databases
Exec=sqlitestudio
Icon=/home/ukhan/Binaries/SQLiteStudio/sqlitestudio.png
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=Development;Utility;Database;
MimeType=application/vnd.db4s-project+xml;application/sqlitestudio;application/x-sqlitestudio;application/vnd.sqlite3;application/geopackage+sqlite3;application/x-sqlite2;application/x-sqlite3;
```
