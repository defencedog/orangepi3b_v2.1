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
You can exit `menuconfig` only after saving the changes made in `nano`

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

Please use Google to find how to trasnfer files to OPI3b using `scp` tool
After installing x3 `.deb` files to Opi3b using `sudo dpkg -i *.deb` next step is to get GPU / VPU acceleration

# GPU VPU aceeleration
```
sudo add-apt-repository ppa:liujianfeng1994/rockchip-multimedia
sudo apt dist-upgrade
sudo apt install rockchip-multimedia-config
sudo reboot
```
When installing above repository terminal may indicate some missing library `v4l0xx` make sue you install it
Afterwards
```
sudo apt purge chromum ffmpeg
sudo apt install ffmpeg chromium-browser{,-l10n} chromium-codecs-ffmpeg-extra mpv vlc
```
# Testing
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








