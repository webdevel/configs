#!/bin/sh

# run window manager
# exec i3 -V >> ~/i3wm-$(date +'%F-%k-%M-%S' | sed 's#\s*##g').log 2>&1
exec i3 &>/dev/null
