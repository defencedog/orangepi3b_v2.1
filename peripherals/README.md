## Peripherals I bought BT / WIFI 
```
https://github.com/et020598/rtl8723du

tar -xvf 20210324_LINUX_BT_DRIVER_RTL8723D_COEX_v3b3b.tar.gz
sudo make install INTERFACE=usb
sudo insmod /lib/modules/$(uname -r)/kernel/drivers/bluetooth/rtk_btusb.ko
reboot
```
