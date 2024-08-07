## Solution 1
Someone contacted the dev through Twitter and relayed the fix through Discord! HUGE props to LegendYang!
run as root
```
io -4 0xFDC60284 0x3f3f3f3f
io -4 0xFDC6028C 0x003f003f
io -4 0xFDC60298 0x3f003f00
io -4 0xFDC6029C 0x3f3f3f3f
io -4 0xfdc60388 0xFFFF0049
```
The posted 'fix' looks like it's having us update the memory addresses. Executing it does fix the issue for me after a few minutes.
do not reboot, or you must re-do commands

## Solution 2
To change the speed you can go to terminal and type 

`sudo ethtool -s eth0 speed 100`

If the command says that the device was not found (my case) check the new name of the adapter by using the following command

`sudo lshw -class network -short`

Then change the word eth0 on the first command to the correspondent name
