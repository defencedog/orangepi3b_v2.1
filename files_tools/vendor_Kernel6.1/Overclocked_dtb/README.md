## Overclocked dtb
- CPU 1.8GHz -> 2.0GHz
- Video Decoder 0.4GHz -> 0.5GHz

## CLI logging of current speeds
```
sudo watch -n 2 cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
sudo watch -n 2 cat /sys/devices/platform/fdf80200.rkvdec/devfreq/fdf80200.rkvdec/cur_freq
```
