# Hardware Accelerated screen recording / casting via ffmpeg under Wayland

All commands entered here are done in `sudo` mode!

`ffmpeg` in Armbian automatically has `rkmpp` support. More about the Rockchip specific video decoders, encoders & filters available read here
> https://github.com/hbiyik/ffmpeg-rockchip/wiki/Filter

The following single line will grab whole screen under _wayland_

## Recording in `h264`

`ffmpeg -device /dev/dri/card0 -framerate 30 -plane_id 56 -f kmsgrab -i - -c:v h264_rkmpp -y screencast_30fps.mp4`

or

`ffmpeg -hwaccel rkmpp -hwaccel_output_format drm_prime -device /dev/dri/card0 -framerate 30 -f kmsgrab -i - -c:v h264_rkmpp -y screencast_30fps.mp4`

`plane_id` may not be necessary else try to get yours by `cat /sys/kernel/debug/dri/0/state | grep 'plane\['` output will vary so hit & try!

## Recording in `hevc`

`ffmpeg -device /dev/dri/card0 -framerate 30 -plane_id 56 -f kmsgrab -i - -c:v hevc_rkmpp -y screencast_30fps.mp4`

or

`ffmpeg -hwaccel rkmpp -hwaccel_output_format drm_prime -device /dev/dri/card0 -framerate 30 -f kmsgrab -i - -c:v hevc_rkmpp -y screencast_30fps.mp4`

## Grabbing particular area in screen recording
I cannot find a proper way to use `rkmpp` filters together with `kmsgrab` option. So record full screen then crop particular area

Select a particular area intuitively via `flameshot gui -g` output will be like

> 781x727+944+185

Video size `781x727` & x|y offsets `944+185`

Then you can use 

`ffmpeg -hwaccel rkmpp -hwaccel_output_format drm_prime -i output-file.mp4 -vf vpp_rkrga=cw=781:ch=727:cx=944:cy=185 -c:v h264_rkmpp -y crop-file.mp4`

## Automated Script with screen cropping
Dont forget to `chmod +x recordscr.sh` & launch via `./recordscr.sh` You can add GNOME keyboard shortcut to this script

_recordscr.sh_
```
#!/bin/bash
homedir=$( getent passwd "$USER" | cut -d: -f6 )
dir="$homedir/Videos/Records"
params=$(flameshot gui -g)
IFS='x+' read width height x y <<< "$params"
now=`date "+%F_%H-%M-%S"`
filename0="${dir}/tmp.mp4"
filename1="${dir}/${now}.mp4"
sudo ffmpeg -hwaccel rkmpp -hwaccel_output_format drm_prime -device /dev/dri/card0 -framerate 25 -f kmsgrab -i - -c:v h264_rkmpp -y "${filename0}"
ffmpeg -hwaccel rkmpp -hwaccel_output_format drm_prime -i "${filename0}" -vf vpp_rkrga=cw="$width":ch="$height":cx="$x":cy="$y" -c:v h264_rkmpp -y "${filename1}"
rm "${filename0}"
xdg-open "${dir}"
```




















