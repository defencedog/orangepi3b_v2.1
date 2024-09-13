## Overclocked dtb
- CPU 1.8GHz -> 2.0GHz [opp-table used](https://github.com/defencedog/orangepi3b_v2.1/blob/main/files_tools/vendor_Kernel6.1/Overclocked_dtb/rk3566-orangepi-3b-v2.1.dts#L7205) [changes](https://github.com/defencedog/orangepi3b_v2.1/blob/main/files_tools/vendor_Kernel6.1/Overclocked_dtb/rk3566-orangepi-3b-v2.1.dts#L501-L510)
- Video Decoder 0.4GHz -> 0.5GHz [opp-table used](https://github.com/defencedog/orangepi3b_v2.1/blob/main/files_tools/vendor_Kernel6.1/Overclocked_dtb/rk3566-orangepi-3b-v2.1.dts#L7325)
 [changes](https://github.com/defencedog/orangepi3b_v2.1/blob/main/files_tools/vendor_Kernel6.1/Overclocked_dtb/rk3566-orangepi-3b-v2.1.dts#L2131-L2134)
- GPU not overclocked however _opp-tables_ can be added within `opp-table-1` as [referenced here](https://github.com/defencedog/orangepi3b_v2.1/blob/main/files_tools/vendor_Kernel6.1/Overclocked_dtb/rk3566-orangepi-3b-v2.1.dts#L7216)
## CLI logging of current speeds
```
sudo watch -n 2 cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
sudo watch -n 2 cat /sys/devices/platform/fdf80200.rkvdec/devfreq/fdf80200.rkvdec/cur_freq
```
## CPU Overclocking
To be done using `sudo armbian-config` System -> CPU (Reboot required)

## Video Decoder Overclocking
To be done by adding `bash -c 'echo "performance" > /sys/devices/platform/fdf80200.rkvdec/devfreq/fdf80200.rkvdec/governor'` to `/etc/rc.local` before last line `exit 0` (Reboot required)
