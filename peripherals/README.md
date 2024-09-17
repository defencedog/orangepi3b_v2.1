# Peripherals I bought 
## BT / WIFI 
The onboard Broadcom AP6256 BT / WIFI chip has good WIFI but poor BT especially for audio streaming; for general purpose keyboard / mouse connectivity it's OK. AP6256 discovers my 5.0GHz WIFI but connection is very unstable. It is stable at 2.5GHz

<img src="BT-WIFI.jpg" width="500" />

I bought both of these the blue one [left] is BT4.X & WIFI 2.5GHz while the green one [right] is BT5.X & WIFI 5.0GHz. Buy the **right** one as the BT / WIFI is superb just use USB3 port to plug it for stability. 

You can see WIFI connection information using `iwconfig`

### Old WIFI / BT kernel module 
Preferred for left device
```
https://github.com/et020598/rtl8723du

tar -xvf 20210324_LINUX_BT_DRIVER_RTL8723D_COEX_v3b3b.tar.gz
sudo make install INTERFACE=usb
sudo insmod /lib/modules/$(uname -r)/kernel/drivers/bluetooth/rtk_btusb.ko
reboot
```
Both the USB chips will work with above kernel module with full functionality i.e WIFI / BT, however, 5.0GHz WIFI is again unstable

### New WIFI / BT kernel module
Preferred for right device


This device when connected to SBC has x2 modes a bootable USB mode & WIFI / BT dongle module. Due to the first mode you may not be able to boot the SBC if it is connected at boot time. When the SBC is running & you plug it in `lsusb` outputs

> Bus 007 Device 002: ID 0bda:1a2b Realtek Semiconductor Corp. RTL8188GU 802.11n WLAN Adapter (Driver CDROM Mode)

To switch its mode to dongle we have to do
