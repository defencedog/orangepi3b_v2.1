Official `dts` `dtb` & `overlays`

## Recompile the dtb and move it back to the firmware directory
```
dtc -I dts -O dtb ~/test.dts -o ~/test.dtb
sudo mv ~/test.dtb /boot/dtb/rickchip/test.dtb
```
