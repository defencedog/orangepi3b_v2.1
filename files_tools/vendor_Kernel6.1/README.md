# Here are `debs` & patches for Vendor Kernel 6.1
The above files can convert your existing Linux platform into a powerful media streaming device. The latest vendor kernel will enble H265 / H264 video decoding. RKNPU is also a useful feature to use. However 3.5mm audio out / microphone is **not working**

## Remove old files & install new
```
apt list --installed |grep -e ^linux-image -e ^linux-dtb -e ^linux-headers
sudo apt purge linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo apt install libssl-dev python-is-python3
sudo dpkg -i linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo sync
sudo reboot
```
Above x3 are minimum requirements for properly updating kernel If your image is booting succesffuly no need to update `u-boot` just update the new `v2.1`` dtb by following [instruction here](https://github.com/defencedog/orangepi3b_v2.1/tree/main/files_tools/vendor_Kernel6.1/Overclocked_dtb#using-this-dtb) 
