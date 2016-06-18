#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if test -f $sysresources; then

    xrdb -merge $sysresources

fi

if test -f $sysmodmap; then

    xmodmap $sysmodmap

fi

if test -f "$userresources"; then

    xrdb -merge "$userresources"

fi

if test -f "$usermodmap"; then

    xmodmap "$usermodmap"

fi

if test -d /etc/X11/xinit/xinitrc.d; then

  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do

    test -x "$f" && source "$f"

  done

  unset f

fi

# set root window options
xsetroot -solid black -cursor_name left_ptr &

# xscreensaver &

# run window manager
# exec i3 -V >> ~/i3wm-$(date +'%F-%k-%M-%S' | sed 's#\s*##g').log 2>&1
# exec i3 &>/dev/null
# exec openbox-session &>/dev/null
# exec openbox --sm-disable --startup ~/.config/openbox/startup >~/openbox.log 2>&1
exec openbox --sm-disable --startup ~/.config/openbox/startup &>/dev/null

