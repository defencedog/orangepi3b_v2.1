# Hardware VPU acceleration for RK3566
You must be using vendor kernel 5.x or 6.x instead of mainline kernel. For this to work use `jammy` release with [this ppa](https://github.com/defencedog/orangepi3b_v2.1/blob/main/Orangepi-3B%20rk3566-5.10.160-panfrost/README.md#gpu-vpu-acceleration) package installed. Use `apt-cache policy <package>` to ensure that mpv / ffmpeg is installed from this repo.

VPU acceleration information
```
https://wiki.postmarketos.org/wiki/Hardware_video_acceleration
https://wiki.pine64.org/wiki/Mainline_Hardware_Decoding
```
## MPV VPU
H265 10bit acceleration is not supported (I am getting a bluescreen), however, H265 8bit (or lower) acceleration is supported. 
### Using CLI
```
mpv --vo=gpu --hwdec=auto video.mp4
```
Terminal must show
> VO: [gpu] XxY drm_prime[nv12]

Use `ls /dev | grep -i dec` to get list of video decoders available
> media-dec0
> 
> media-dec1
> 
> video-dec1

Now trying this
```
mpv --vo=gpu --hwdec=video-dec1 video.mp4
```
Terminal must show
> VO: [gpu] XxY yuv420p

The result was poor than before & many frames were dropped!

Thus to get things done rightly by default
```
cd ~/.config/mpv
nano mpv.conf
```
file contents
> vo=gp
> 
> hwdec=auto
> 
> af=lavfi=[loudnorm]

### Using GUI Celluloid
[AskUbuntu comment](https://askubuntu.com/a/1330777) & [program's FAQ](https://celluloid-player.github.io/faq.html) is more than enough...

## FFPLAY VPU
Hurray, H265 10bit acceleration is supported! Check VPU decoders available
```
$ffmpeg -decoders | grep rkmpp

 V..... av1_rkmpp            Rockchip MPP (Media Process Platform) AV1 decoder (codec av1)
 V..... h263_rkmpp           Rockchip MPP (Media Process Platform) H263 decoder (codec h263)
 V..... h264_rkmpp           Rockchip MPP (Media Process Platform) H264 decoder (codec h264)
 V..... hevc_rkmpp           Rockchip MPP (Media Process Platform) HEVC decoder (codec hevc)
 V..... mpeg1_rkmpp          Rockchip MPP (Media Process Platform) MPEG1VIDEO decoder (codec mpeg1video)
 V..... mpeg2_rkmpp          Rockchip MPP (Media Process Platform) MPEG2VIDEO decoder (codec mpeg2video)
 V..... mpeg4_rkmpp          Rockchip MPP (Media Process Platform) MPEG4 decoder (codec mpeg4)
 V..... vp8_rkmpp            Rockchip MPP (Media Process Platform) VP8 decoder (codec vp8)
 V..... vp9_rkmpp            Rockchip MPP (Media Process Platform) VP9 decoder (codec vp9)
```
### Using CLI
Use this command `ffplay -vcodec hevc_rkmpp video.mp4` To make things easier `nano ~/.bash_profile` Add following lines to `.bash_profile` You can add more aliases or customise a shorter name

> alias ffplay264="ffplay -vcodec h264_rkmpp"
> 
> alias ffplay265="ffplay -vcodec hevc_rkmpp"

Then you can just `ffplay265 video.mp4`

Keyboard controls to make life easy
```
q, ESC            quit
f                 toggle full screen
p, SPC            pause
a                 cycle audio channel in the current program
v                 cycle video channel
t                 cycle subtitle channel in the current program
c                 cycle program
w                 cycle video filters or show modes
s                 activate frame-step mode
left/right        seek backward/forward 10 seconds
down/up           seek backward/forward 1 minute
page down/page up seek backward/forward 10 minutes
mouse Rclick      seek to percentage in file corresponding 
                  to fraction of width
```
### Using GUI
Cannot find any :( Please write to me if you have an idea
