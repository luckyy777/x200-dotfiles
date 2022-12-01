#!/bin/sh
s="$(cat /proc/uptime | awk '{printf $1"\n"}')"
d="$((s / 60 / 60 / 24)) days"
h="$((s / 60 / 60 % 24)) hours"
m="$((s / 60 % 60)) mins"
# Remove plural if < 2.
((${d/ *} == 1)) && d=${d/s}
((${h/ *} == 1)) && h=${h/s}
((${m/ *} == 1)) && m=${m/s}

# Hide empty fields.
((${d/ *} == 0)) && unset d
((${h/ *} == 0)) && unset h
((${m/ *} == 0)) && unset m

uptime=${d:+$d, }${h:+$h, }$m
uptime=${uptime%', '}
uptime=${uptime:-$s secs}
echo $uptime
