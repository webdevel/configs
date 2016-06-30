#!/bin/sh

# time in minutes, maximum is 60
TIME=30

pidof xautolock 2>/dev/null

if test 0 -ne $?; then

  xautolock -time $TIME -locker "systemctl suspend" &

fi
