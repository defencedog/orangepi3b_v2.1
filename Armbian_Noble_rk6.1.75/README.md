# Noble Armbian release with vendor kernel 6.1.75

## Bugs resolved
- Audio out not coming from 3.5mm jack [pull request](https://github.com/armbian/build/pull/7330#issuecomment-2392746104)
- Audio devices names are corrected
- Clean shutdown (no LED activity)

## Bugs NOT resolved
- Microphone / audio capture using 3.5mm jack not working (this is working in [mainline kernel here](https://github.com/defencedog/orangepi3b_v2.1/tree/main/MicroLinux_Armbian_Orangepi3b_jammy_edge_6.6.4))

## What works
Every piece of hardware -> GPU, NPU, OpenCL (Rusticl), all USB x4 ports, NVME, LEDs, GPIO

## OS images & related files

```
Armbian-unofficial_24.11.0-trunk_Orangepi3b_noble_vendor_6.1.75_gnome-kisak_deskto
https://mega.nz/file/p3YwFQoL#Ini_GFkRggRme4ZwB-Q8r7TzCPNgSle4sMHOBbZp080

linux-dtb-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75
https://mega.nz/file/UrIx1aLC#K8hjSjivMsbxKPh_JT5BO5Ta3FxHMl0FgNYPjcUqVe8

linux-image-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75
https://mega.nz/file/puJxDLoa#KYSvbQrd6pr-fFMSZDQW2BLkYQMQJWmo90OnBSP_6pc

linux-headers-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75
https://mega.nz/file/QigGXaKC#J5-aW_vmwMq_YWkHaMuyxClNW9i5CqiciOzUfnvry7k

armbian-bsp-cli-orangepi3b-vendor_24.11.0-trunk_arm64
https://mega.nz/file/9ihUBD4R#_WODTJtkGUWEEvj9H4GJB_zBUCvebDFLq1n7QYgoq9M

linux-libc-dev-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75
https://mega.nz/file/5vhDlTgI#fAorGTxzz_aXeYzBIRLEN05Vbe4RuNjWrHdhjjXBIog

```

## Custom Overclocked DTB
Added in this repo. Overwrite at `/boot/dtb/rockchip/` If you are not using current `u-boot` (that latest automatically identifies SBC version) you can modify `/boot/armbianEnv.txt` & add `fdtfile=rockchip/<file.dtb>`

What is changed in OC refer [detailed information here](https://github.com/defencedog/orangepi3b_v2.1/tree/main/files_tools/vendor_Kernel6.1/Overclocked_dtb)











