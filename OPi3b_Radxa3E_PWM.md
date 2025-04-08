# OrangePi 3b PWM

## Preliminary Video
https://m.youtube.com/watch?v=xHDT4CwjUQE&pp=ygUYUHdtIGV4cGxhaW5pbmcgY29tcHV0ZXJz

## Activate PWM overlays
Host `6.1.75-vendor-rk35xx` Armbian
Copy x2 files /boot/dtb/rockchip/overlay Take care of naming syntax
> rk356x-pwm11-m1.dtbo
> rk356x-pwm15-m1.dtbo

For Radaxa3E following overlays can be activated
```
rk3568-pwm12-m1.dts
rk3568-pwm13-m1.dts
rk3568-pwm14-m0.dts
rk3568-pwm14-m1.dts
rk3568-pwm15-m1.dts
rk3568-pwm8-m0.dts
rk3568-pwm9-m0.dts
```

Edit _/boot/armbianEnv.txt_ & reboot
```
verbosity=4
bootlogo=true
console=both
extraargs=cma=256M
overlay_prefix=rk356x #must match prefix of overlays
overlays=pwm11-m1 pwm15-m1 
rootdev=UUID=62f0e84d-5e0b-4889-9d4d-69d89d79b335
rootfstype=ext4
usbstoragequirks=0x2537:0x1066:u,0x2537:0x1068:u
```
**Preferable method** is not to edit any file rather use `sudo armbian-add-overlay <dts>` & reboot

## Check hardware
```bash
ls /sys/class/pwm/ -l
lrwxrwxrwx 1 root root 0 Mar 24 01:34 pwmchip0 -> ../../devices/platform/fe6e0030.pwm/pwm/pwmchip0
lrwxrwxrwx 1 root root 0 Mar 24 01:34 pwmchip1 -> ../../devices/platform/fe6f0030.pwm/pwm/pwmchip1
lrwxrwxrwx 1 root root 0 Mar 24 01:02 pwmchip2 -> ../../devices/platform/fe700030.pwm/pwm/pwmchip2
```
`fe70030` corresponds to PIN 7  & `fe6f0030` corresponds to PIN 32 (per OPi3b manual)
## Mathematics 
Use `qalc` CLI calculator. 
```
> cycle= 1/(20 Hz) to ns
  save(1 / (20 hertz), cycle, Temporary, , 1) = 50000000 ns
> cycle * 0.8 to ns
  cycle × 0.8 = 40000000 ns
> cycle * 0.5 to ns
  cycle × 0.5 = 25000000 ns
> cycle * 0.3 to ns
  cycle × 0.3 = 15000000 ns
```
## Configuring PWM
In this example PIN 7 or pwmchip2 is used. All after `sudo su`
```bash
echo 0 > /sys/class/pwm/pwmchip2/export #export pwm3 to user space
echo normal > /sys/class/pwm/pwmchip2/pwm0/polarity
echo 50000000 > /sys/class/pwm/pwmchip2/pwm0/period #20Hz PWM period in nanoseconds
echo 50000000 > /sys/class/pwm/pwmchip2/pwm0/duty_cycle #nonflickering brightest LED
echo 0 > /sys/class/pwm/pwmchip2/pwm0/duty_cycle #LED off
echo 40000000 > /sys/class/pwm/pwmchip2/pwm0/duty_cycle #80% voltage
echo 15000000 > /sys/class/pwm/pwmchip2/pwm0/duty_cycle #30% voltage
echo 1 > /sys/class/pwm/pwmchip2/pwm0/enable #activate
cat /sys/kernel/debug/pwm #monitor current settings
echo 0 > /sys/class/pwm/pwmchip2/pwm0/enable #deactivate
echo 0 > /sys/class/pwm/pwmchip2/unexport #remove PWM from user space
```
## Python Example
`sudo apt install python-periphery-doc python3-periphery`
Launch via `sudo python ./pwm_periphery.py`
> pwmchip:2
> channel:0

Another example *breathing LED*
```python
from periphery import PWM
import time

pwm = PWM(2, 0)  #PWM object is initialized for pwmchip2 channel0

try:
    pwm.frequency = 1000 #PWM frequency is set to 1000 Hz
    pwm.duty_cycle = 0
    pwm.polarity = "normal"
    pwm.enable()
    direction = 1  

    while True:
        pwm.duty_cycle += 0.01 * direction
        pwm.duty_cycle = round(pwm.duty_cycle, 2) #round function is used to keep it to two decimal places
        if pwm.duty_cycle == 1.0: #reaching the maximum the direction is reversed
            direction = -1
        elif pwm.duty_cycle == 0.0: ##reaching the minimum the direction is reversed
            direction = 1
            
        time.sleep(0.05) 

except KeyboardInterrupt:
    pass

finally:
    pwm.close()
```

Another example *SG90 360degree servo*
> https://protosupplies.com/product/servo-motor-micro-sg90-360-degree-continuous-rotation/
```
from periphery import PWM, sleep_ms

pwm = PWM(0, 0)  #PWM object is initialized for pwmchip2 channel0

try:
    pwm.frequency = 500 #PWM frequency is set to 1000 Hz
    pwm.duty_cycle = 0
    pwm.polarity = "normal"
    pwm.enable()
    direction = 1

    while True:
        pwm.duty_cycle += 0.05 * direction
        pwm.duty_cycle = round(pwm.duty_cycle, 2) #round function is used to keep it to two decimal places
        print("Duty Cycle%", round(pwm.duty_cycle_ns*100/pwm.period_ns,2), "Duty Cycle", pwm.duty_cycle_ns)
        if pwm.duty_cycle == 1.0: #reaching the maximum the direction is reversed
            direction = -1
        elif pwm.duty_cycle == 0.0: #reaching the minimum the direction is reversed
            direction = 1
        sleep_ms(100) #time in milliseconds

except KeyboardInterrupt:
    print('\nBye')

finally:
    sleep_ms(50)
    pwm.duty_cycle = 0
    sleep_ms(50)
    pwm.close()
    print('PWM Reset')

# 125 Hz 180 deg
# 250 Hz 180+25 deg
# 500 Hz 90+45 deg
# 1000 Hz 45 deg
```
