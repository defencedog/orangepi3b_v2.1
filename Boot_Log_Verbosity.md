# How to provide boot logs for inspection?
OPi3b has 3pin Debug serial port thus best to use tty serial console buy one immediately! Go to section _How to use the debugging serial port_ in this [pdf manual](https://github.com/defencedog/orangepi3b_v2.1/blob/main/manuals/Orange%20Pi%203B%20-%20Wiki-Orange%20Pi.pdf)

## Best solution
Verbosity levels are explained below `4` is OK enough then tty serial console can be used to debug SBC

```
+---+--------------+----------------------------------+
| N | Mnemonic     | Description                      |
+---+--------------+----------------------------------+
| 0 | KERN_EMERG   | system is unusable               |
| 1 | KERN_ALERT   | action must be taken immediately |
| 2 | KERN_CRIT    | critical conditions              |
| 3 | KERN_ERR     | error conditions                 |
| 4 | KERN_WARNING | warning conditions               |
| 5 | KERN_NOTICE  | normal but significant condition |
| 6 | KERN_INFO    | informational                    |
| 7 | KERN_DEBUG   | debug-level messages             |
+---+--------------+----------------------------------+
```
Modify first line
```
sudo nano /boot/armbianEnv.txt
```

## Alternative
When your SBC behaves strange look into your kernel logs. Following tool that grabs info and pastes it to an online pasteboard service. Please increase boot verbosity as shown above (verbosity=7), reboot and then run

```
sudo armbianmonitor -u
```
