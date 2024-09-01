## To get maximum speed while update / upgrade
```
sudo nano /etc/apt/sources.list
```
`Ctrl`+`\` search for -> huawei.repo | replace with -> ports.ubuntu then press `A` to replace all occurences

Result will be
```
deb http://ports.ubuntu.com/ubuntu-ports jammy main restricted universe multiverse
```
then `sudo apt update && sudo apt upgrade -y`
