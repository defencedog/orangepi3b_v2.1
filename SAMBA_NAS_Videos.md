## Playing Videos & Media on SAMBA NAS

You can mount _samba_ shares within _nautilus_ after installing these tools `sudo apt install smbclinet gvfs-backends cifs-utils` however you will not be able to stream media from _smplayer_ or _vlc_ because default `ffmpeg` is not compiled with _smb_ protocol support.

`ffmpeg -hide_banner -protocols` don't show any `smb` entry, this is where `cifs-utils` are needed. More on this on armbian forum's [here](https://forum.armbian.com/topic/29719-media-players-not-playing-files-over-smb-is-ffmpeg-compiled-without-networking-support/?do=findComment&comment=170553)

Standard way to mount _smb_ diretories in _nautilus_ is via using GUI or via `gio mount smb://<server_name>/<share_name>`

To stream media directly you need to mount _smb_ shares using `cifs`. Examples:

```
mkdir ~/smb-dir/
sudo mount -t cifs -o username=<serverUser>,vers=3.0 //<serverIP>/<shareDir> ~/smb-dir/
sudo umount ~/smb-dir/ # to unmount smb dir
```

The `vers` flag is important. More on this can be found [here](https://askubuntu.com/a/1070656/110979)

The above method mount _smb_ directories in read-only mode. You can mount with full-access. Also you can mount each _smb_ share on boot. Details are here
```
https://askubuntu.com/a/1050499/110979 # full access
https://ubuntu.com/server/docs/how-to-mount-cifs-shares-permanently # auto-mount on boot
https://askubuntu.com/a/1067085/110979 # auto-mount on boot
https://askubuntu.com/a/921143/110979 # auto-mount on boot
```
For instance
Create file containing Windows login details `nano ~/.smbcredentials`

> username=msusername
> 
> password=mspassword

`chmod 600 ~/.smbcredentials`

Add _samba_ shares via `sudo nano /etc/fstab` & I added this entry in new line. You can add more each per line
```
//172.168.1.14/nas_1 /media/nas_1 cifs uid=orangepi,credentials=/home/orangepi/.smbcredentials 0 0
//172.168.1.14/nas_2 /media/nas_2 cifs uid=orangepi,credentials=/home/orangepi/.smbcredentials 0 0
```
After reboot the drives are not auto-mounted & I have to manually do `sudo mount -a`. To avoid it
```
sudo nano /etc/rc.local
```
> sleep 20 && mount -a
> 
> exit 0

Again reboot & see the results of `sudo systemctl status rc-local.service`. There should be no error now. `sleep 20` is added to delay 20 seconds for WIFI startup
