# Hardware VPU acceleration for RK3566
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
> hwdec=auto
> af=lavfi=[loudnorm]

### Using GUI Celluloid
[AskUbuntu comment](https://askubuntu.com/a/1330777) is more than enough...
