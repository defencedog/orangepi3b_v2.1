# Hardware acceleration for RK3566
HEVC X265 acceleration is not supported. More on this here
```
https://wiki.postmarketos.org/wiki/Hardware_video_acceleration
https://wiki.pine64.org/wiki/Mainline_Hardware_Decoding
```
## Using CLI
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
> vo=gpu
> 
> hwdec=auto

## Saving & loading MPV settings in Celluloid
[AskUbuntu comment](https://askubuntu.com/a/1330777) is more than enough...
