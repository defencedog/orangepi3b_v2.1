Original [Chinese instructions](https://www.bilibili.com/read/cv28853443/)
Also read [official instructions](http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_3B#Compile_the_Linux_kernel)

## Pre-requisites
These [steps](https://github.com/defencedog/orangepi3b_v2.1/blob/main/Create_Build_System_VM/README.md) are to be completed if cross-compiling

```
git clone https://github.com/orangepi-xunlong/orangepi-build.git -b next
cd orangepi-build
sudo ./build.sh
kernel package --> show a kernel configuration menu before compilation --> orangepi-3b --> legacy Old stable / Legacy --> Show kernel Configuration menu
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

## Warning 
### Edit .dts files 
Before 'exiting' build script `menuconfig`; open another terminal or ssh session; `sudo nano` & modify x2 `.dts` files (You have add x2 lines after `&gpu` & may have to modify `cursor-win-id` argument):

```
kernel/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dts
kernel/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.dts

删除第1075行：cursor-win-id = <ROCKCHIP_VOP2_CLUSTER0>;
在340行下面：&gpu {
增加第341行：clock-names = "gpu", "bus";
增加第342行：interrupt-names = "gpu", "mmu", "job";

```

### Edit .dtsi file
According to the image attached some modifications are to be done `kernel/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3568.dtsi`

Have to comment out `//` lines 1391、1396、1401、1406、1415、1424 having content `opp-support-hw = <0xfb 0xffff>`

This will remove following `dmesg` errors

```
Jul  8 01:05:20 orangepicm4 kernel: 【    7.148588】 panfrost fde60000.gpu: clock rate = 594000000
Jul  8 01:05:20 orangepicm4 kernel: 【    7.148608】 panfrost fde60000.gpu: bus_clock rate = 500000000
Jul  8 01:05:20 orangepicm4 kernel: 【    7.149663】 panfrost fde60000.gpu: Looking up mali-supply from device tree
Jul  8 01:05:20 orangepicm4 kernel: 【    7.149893】 panfrost fde60000.gpu: _of_add_opp_table_v2: no supported OPPs
Jul  8 01:05:20 orangepicm4 kernel: 【    7.150872】 panfrost fde60000.gpu: devfreq init failed -2
Jul  8 01:05:20 orangepicm4 kernel: 【    7.150893】 panfrost fde60000.gpu: Fatal error during GPU init
Jul  8 01:05:20 orangepicm4 kernel: 【    7.151072】 panfrost: probe of fde60000.gpu failed with error -2
```

![bug](https://github.com/user-attachments/assets/743826e7-7642-47e7-9ba4-5bf4bda9f27e)

You can exit `menuconfig` only after saving the changes made in `nano`

Build will now start & after it completes x3 `.deb` files will be located in `output/debs/`

## Compile errors
### Solution 1
In case of an error try following
```
sudo apt install gcc-11-aarch64-linux-gnu
cd kernel/orange-pi-5.10-rk35xx
sudo make clean ARCH=arm64
sudo make dtbs ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

### Solution 2
In my case I have this persistent error
```
make: *** [Makefile:1304: vmlinux] Error 1
[ error ] ERROR in function compile_kernel
```

So in `Show kernel Configuration menu` I removed Midguard support
```
<*> Mali Midguard series support ---> <> Mali Midguard series support
```

Afterwards reinitate above build process. 
`sudo ./build.sh BOARD=orangepi3b BRANCH=legacy BUILD_OPT=kernel KERNEL_CONFIGURE=no`

Please use Google to find how to trasnfer files to OPI3b using `scp` tool

## On OrangePi 3b
Remove old files & install new
```
apt list --installed |grep -e ^linux-image -e ^linux-dtb -e ^linux-headers
sudo apt purge linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo apt install libssl-dev python-is-python3
sudo dpkg -i linux-image-xxx linux-dtb-xxx linux-headers-xxx
sudo sync
sudo reboot
```
After installing x3 `.deb` files to Opi3b using `sudo dpkg -i *.deb` (better to move `.deb` files into a separate folder) next step is to get GPU / VPU acceleration

## GPU VPU acceleration
```
sudo apt install libv4l-0 libv4l-rkmpp
sudo add-apt-repository ppa:liujianfeng1994/rockchip-multimedia
sudo apt dist-upgrade
sudo apt install rockchip-multimedia-config
sudo reboot
```
When installing above repository terminal may indicate some missing library `libv4l-0` make sure you install it as it provides VPU acceleration for chromium

After restarting, check that `/dev/video-enc0` and `/dev/video-dec0` should exist and belong to the group "video". At the same time, the logged-in user should also have the "video" group permissions to perform hardware encoding and hard encoding. This is relevant for creating VPU accelerated `Jellyfin` setup as explained in [this tutorial](https://akashrajpurohit.com/blog/setup-jellyfin-with-hardware-acceleration-on-orange-pi-5-rockchip-rk3558/) Remember device `/dev/mali0` is not there for OPi3b

Afterwards
```
sudo apt purge chromium ffmpeg
sudo apt install ffmpeg chromium-browser{,-l10n} chromium-codecs-ffmpeg-extra mpv vlc kodi libvl-rkmpp
```
## Testing
Check if mali hardware is initiated
```
$sudo cat /var/log/kern.log |grep panfrost
Aug  5 00:59:36 orangepi3b kernel: [   12.209009] panfrost fde60000.gpu: clock rate = 594000000
Aug  5 00:59:36 orangepi3b kernel: [   12.209030] panfrost fde60000.gpu: bus_clock rate = 500000000
Aug  5 00:59:36 orangepi3b kernel: [   12.209155] panfrost fde60000.gpu: Looking up mali-supply from device tree
Aug  5 00:59:36 orangepi3b kernel: [   12.210381] panfrost fde60000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
Aug  5 00:59:36 orangepi3b kernel: [   12.210395] panfrost fde60000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
Aug  5 00:59:36 orangepi3b kernel: [   12.210401] panfrost fde60000.gpu: Features: L2:0x07110206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
Aug  5 00:59:36 orangepi3b kernel: [   12.210406] panfrost fde60000.gpu: shader_present=0x1 l2_present=0x1
Aug  5 00:59:36 orangepi3b kernel: [   12.212259] [drm] Initialized panfrost 1.1.0 20180908 for fde60000.gpu on minor 2
Aug  5 01:13:31 orangepi3b kernel: [   12.155162] panfrost fde60000.gpu: clock rate = 594000000
Aug  5 01:13:31 orangepi3b kernel: [   12.155186] panfrost fde60000.gpu: bus_clock rate = 500000000
Aug  5 01:13:31 orangepi3b kernel: [   12.155311] panfrost fde60000.gpu: Looking up mali-supply from device tree
Aug  5 01:13:31 orangepi3b kernel: [   12.156351] panfrost fde60000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
Aug  5 01:13:31 orangepi3b kernel: [   12.156363] panfrost fde60000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
Aug  5 01:13:31 orangepi3b kernel: [   12.156369] panfrost fde60000.gpu: Features: L2:0x07110206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
Aug  5 01:13:31 orangepi3b kernel: [   12.156373] panfrost fde60000.gpu: shader_present=0x1 l2_present=0x1
Aug  5 01:13:31 orangepi3b kernel: [   12.158060] [drm] Initialized panfrost 1.1.0 20180908 for fde60000.gpu on minor 2
$ sudo cat /var/log/syslog |grep panfrost
Aug  5 00:59:36 orangepi3b kernel: [   12.209009] panfrost fde60000.gpu: clock rate = 594000000
Aug  5 00:59:36 orangepi3b kernel: [   12.209030] panfrost fde60000.gpu: bus_clock rate = 500000000
Aug  5 00:59:36 orangepi3b kernel: [   12.209155] panfrost fde60000.gpu: Looking up mali-supply from device tree
Aug  5 00:59:36 orangepi3b kernel: [   12.210381] panfrost fde60000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
Aug  5 00:59:36 orangepi3b kernel: [   12.210395] panfrost fde60000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
Aug  5 00:59:36 orangepi3b kernel: [   12.210401] panfrost fde60000.gpu: Features: L2:0x07110206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
Aug  5 00:59:36 orangepi3b kernel: [   12.210406] panfrost fde60000.gpu: shader_present=0x1 l2_present=0x1
Aug  5 00:59:36 orangepi3b kernel: [   12.212259] [drm] Initialized panfrost 1.1.0 20180908 for fde60000.gpu on minor 2
Aug  5 01:13:31 orangepi3b kernel: [   12.155162] panfrost fde60000.gpu: clock rate = 594000000
Aug  5 01:13:31 orangepi3b kernel: [   12.155186] panfrost fde60000.gpu: bus_clock rate = 500000000
Aug  5 01:13:31 orangepi3b kernel: [   12.155311] panfrost fde60000.gpu: Looking up mali-supply from device tree
Aug  5 01:13:31 orangepi3b kernel: [   12.156351] panfrost fde60000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
Aug  5 01:13:31 orangepi3b kernel: [   12.156363] panfrost fde60000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
Aug  5 01:13:31 orangepi3b kernel: [   12.156369] panfrost fde60000.gpu: Features: L2:0x07110206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
Aug  5 01:13:31 orangepi3b kernel: [   12.156373] panfrost fde60000.gpu: shader_present=0x1 l2_present=0x1
Aug  5 01:13:31 orangepi3b kernel: [   12.158060] [drm] Initialized panfrost 1.1.0 20180908 for fde60000.gpu on minor 2

```

Following benchmark will not work on `xfce` will only work in `gnome3` desktop environment
```
sudo apt install glmark2 glmark2-es2
glmakr2
```
After launhching `chromium` visit link `chrome://flags` & enable all HW accelerated features. You can use Ctrl+F & search `accelerate` string. 

- Override software rendering list
- GPU rasterization
- Toggle hardware accelerated H.264 video encoding for Cast Streaming
- Toggle hardware accelerated VP8 video encoding for Cast Streaming
- Use the MojoVideoDecoder for hardware video decoding in Pepper

Restart & visit link `chrome://gpu` Following parts are important

```
Graphics Feature Status
Canvas: Hardware accelerated
Canvas out-of-process rasterization: Enabled
Direct Rendering Display Compositor: Disabled
Compositing: Hardware accelerated
Multiple Raster Threads: Enabled
OpenGL: Enabled
Rasterization: Hardware accelerated on all pages
Raw Draw: Disabled
Video Decode: Hardware accelerated
Video Encode: Software only. Hardware acceleration disabled
Vulkan: Disabled
WebGL: Hardware accelerated
WebGL2: Hardware accelerated
WebGPU: Disabled
.
.
.
Video Acceleration Information
Decoding
Decode hevc main
48x48 to 3840x2160 pixels
Decode hevc main 10
48x48 to 3840x2160 pixels
Decode hevc main still-picture
48x48 to 3840x2160 pixels
Decode h264 baseline
48x48 to 3840x2160 pixels
Decode h264 main
48x48 to 3840x2160 pixels
Decode h264 high
48x48 to 3840x2160 pixels
Decode vp8
48x48 to 3840x2160 pixels
Decode vp9 profile0
48x48 to 3840x2160 pixels
Encoding
```








