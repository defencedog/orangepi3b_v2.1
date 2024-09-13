# Here are `debs` & patches for Vendor Kernel 6.1
The above files can convert your existing Linux platform into a powerful media streaming device. The latest vendor kernel will enble H265 / H264 video decoding. RKNPU is also a useful feature to use. However 3.5mm audio out / microphone is **not working**

```
armbian-bsp-cli-orangepi3b-vendor_24.11.0-trunk_arm64__1-PC9787-V0202-H2670-B199a-R89c9.deb
https://mega.nz/file/Qih0gLDB#EW_cNF-YIpFR4MtNHRP6T2q4-l4tYvuxeHiP9WDziKU
linux-dtb-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75-S7103-D53de-P9724-C0114H5c21-HK01ba-Vc222-B6077-R448a.deb
https://mega.nz/file/EmphkSjL#dg2UUhWaWl-yZL-aVXjBFU_k83fXsVhjTZk4GN42l_Q
linux-headers-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75-S7103-D53de-P9724-C0114H5c21-HK01ba-Vc222-B6077-R448a.deb
https://mega.nz/file/c2xGTKxJ#K9dlqkJVnnzhJt-en5mtZUCniah_e-tvo941KUlo8kk
linux-image-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75-S7103-D53de-P9724-C0114H5c21-HK01ba-Vc222-B6077-R448a.deb
https://mega.nz/file/ojJGFLDZ#2w1F3oJUZVDNI564hSwarald-02wvzHU9gnk2nAKWSs
linux-libc-dev-vendor-rk35xx_24.11.0-trunk_arm64__6.1.75-S7103-D53de-P9724-C0114H5c21-HK01ba-Vc222-B6077-R448a.deb
https://mega.nz/file/hz5TCKhJ#JdxmgLFKWqNIWi_ABDQ-DjelfPEG1Sm8hpRYHY-dows
linux-u-boot-orangepi3b-vendor_24.11.0-trunk_arm64__2024.10-rc3-Sd11a-P0000-H264e-V155b-Bda0a-R448a.deb
https://mega.nz/file/c3xTDICL#QUtkBSQPv57mkHV2Z_s8y1279AmkkmlpjW_Y8K9hKTk
```

## Remove old files & install new
```
apt list --installed |grep -e ^linux-image -e ^linux-dtb -e ^linux-headers
sudo apt purge linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo apt install libssl-dev python-is-python3
sudo dpkg -i linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo sync
sudo reboot
```
Above x3 are minimum requirements for properly updating kernel If your image is booting successfully no need to update `u-boot` just update the new `v2.1` dtb by following [instruction here](https://github.com/defencedog/orangepi3b_v2.1/tree/main/files_tools/vendor_Kernel6.1/Overclocked_dtb#using-this-dtb) 
