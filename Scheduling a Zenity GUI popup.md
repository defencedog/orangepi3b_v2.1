If you want to schedule a non-GUI command to run every day without using `cron` but instead using built-in `systemd` [this tutorial](https://www.tecmint.com/schedule-job-without-cron-linux/) is sufficient. However struggling with `zenity` to show a GUI popup the above tutorial didn't work rather this [Superuser comment](https://superuser.com/a/1128905) worked. 

Long story short; for GUIs one has to run `.timer` & `.service` as user instead of root otherwise `systemctl status` kept showing 
> Failed to open display

Proper procedure follows:
```
cd ~/.config/systemd/user/
nano ukhan_alarm.timer
nano ukhan_alarm.service #filenames must match
systemctl --user enable ukhan_alarm.timer
systemctl --user start ukhan_alarm.timer
```

File contents

_ukhan_alarm.timer_
```
[Unit]
Description=UKhan Alarm

[Timer]
OnCalendar=*-*-* 19:00:00
# Everyday 5:00 PM

[Install]
WantedBy=timers.target
```
_ukhan_alarm.service_
```
[Unit]
Description=UKhan Alarm

[Service]
ExecStart=/bin/bash -c 'zenity --info --text="Go get tea"'

[Install]
WantedBy=multi-user.target
```

In case you made changes to `.timer` or `.service` file just do `systemctl --user daemon-reload`

Some useful debugging commands
```
systemctl --user status  ukhan_alarm.timer #useful for any syntax related error
systemctl --user status  ukhan_alarm.service #useful if bash command failed
systemctl --user list-unit-files #view all user units
```
Some examples to illustrate `OnCalendar` syntax in `.timer` file
```
## Run every day at 3:00 AM ##
OnCalendar=*-*-* 03:00:00

## Run every Monday and Friday at 10:00 AM ##
OnCalendar=Mon,Fri *-*-* 10:00:00

## Run every 30 minutes: ##
OnCalendar=*-*-* *:0/30:00
```
