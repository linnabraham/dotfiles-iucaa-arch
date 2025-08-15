#!/bin/bash
mpd-mpris &
setbg -s /home/linn/Downloads/wallpapers
alttab -w 1 -fg "#d58681" -bg "#4a4a4a" -frame "#eb564d" -t 128x150 -i 127x64 -d 1 &
xclickroot xmenu.sh &
sxhkd &
mail-notify.sh &
iucaa-mail-notify.sh &
copyq &
pgrep -f khal-notify.py > /dev/null || khal-notify.py &
/usr/bin/dropbox &
mpdscribble &
active-time &
transmission-daemon &
# Change blank time to 1 hour
xset dpms 3600 3600 3600
# lock screen after 8 min of inactivity
xautolock -time 8 -locker blurlock.sh -detectsleep &
