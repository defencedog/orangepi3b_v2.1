Original [Chinese instructions](https://www.bilibili.com/read/cv28853443/)
Also read [official instructions](http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_3B#Compile_the_Linux_kernel)

```
git clone https://github.com/orangepi-xunlong/orangepi-build.git -b next
cd orangepi-build
sudo ./build.sh
```
## Important notice
The orangepi-bulid compilation system will first synchronize the Linux kernel source code with the Linux kernel source code of the github server when compiling the Linux kernel source code, so if you want to modify the Linux kernel source code, you first need to turn off the update function of the source code (you need to compile it once This function can only be turned off after the Linux kernel source code, otherwise it will prompt that the source code of the Linux kernel cannot be found. If the source code compressed package downloaded from Google cloud disk, there is no such problem, because the source code of Linux has been cached), otherwise the The changes made will be reverted as follows:

`nano userpatches/config-default.conf` & set the `IGNORE_UPDATES` variable to "yes"

## Changes to make
```
Device Drivers ---> Graphics support --->
#标记：
<*> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)  ---> [ ] Ignore drm ioctl permission（取消标记）
#返回上层继续向下翻查，标记：
<M> Panfrost (DRM support for ARM Mali Midgard/Bifrost GPUs)
#继续向下翻查，标记：
<*> Mali Bifrost series support ---> <*> Enable Mali CSF based GPU support
```

# Warning 
Before 'exiting' build script `menuconfig`; open another terminal or ssh session; `sudo nano` & modify x2 `.dts` files:

```
kernel/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dts
kernel/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.dts

删除第1075行：cursor-win-id = <ROCKCHIP_VOP2_CLUSTER0>;
在340行下面：&gpu {
增加第341行：clock-names = "gpu", "bus";
增加第342行：interrupt-names = "gpu", "mmu", "job";

```
You can exit `menuconfig` only after saving. 

Build will now start & after it completes x3 `.deb` files will be located in `output/debs/`

In case of an error try following
```
sudo apt install gcc-11-aarch64-linux-gnu
cd kernel/orange-pi-5.10-rk35xx
sudo make clean ARCH=arm64
sudo make dtbs ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

Afterwards reinitate above build process. 
`sudo ./build.sh BOARD=orangepi3b BRANCH=legacy BUILD_OPT=kernel KERNEL_CONFIGURE=no`











