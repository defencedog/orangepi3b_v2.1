Here located are binaries, firmwares, drivers, source files that are not common as well as SBC dts/dtb files

### Caution with split-volume archives
It is observed that `p7zip-full` default `7z` binary do not properly extract split-volume binaries, thus, user is request to download / extract `7z2408-linux-arm64.tar.xz` & then copy c2 binaries `7zz` & `7zzs` to `/ur/local/bin` Use these instead of default `7z`

To create split-volume archive (with 20mb split adequate for github)
```
7zz a folder.7z -v20m folder
```
To extract split-volume archives
```
7zz x folder.7z.001
```
