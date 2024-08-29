Official `dts` `dtb` & `overlays`

## Decompile the current dtb (ignore warnings)
`dtc -I dtb -O dts /boot/dtb/rickchip/test.dtb -o ~/test.dts`

## Recompile the dtb and move it back to the firmware directory
```
dtc -I dts -O dtb ~/test.dts -o ~/test.dtb
sudo mv ~/test.dtb /boot/dtb/rickchip/test.dtb
```
