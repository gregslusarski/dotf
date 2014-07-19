#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# map caps-lock to escape (easier to hit in vim)
setxkbmap -option caps:escape
# urxvt settings etc.
xrdb -merge ~/.Xresources
# set cursor (xmonad wm)
xsetroot -cursor_name left_ptr
# set wallpaper (xmonad wm)
feh --bg-fill ~/pics/wallp/macos/wallpaper-1119794.jpg
# autostart
synclient touchpadoff=1 &
xbindkeys &
xmobar &
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 19 \
 --alpha 0 --margin 170 &
redshift &
clipit &
dropboxd &
urxvt &
pcmanfm &
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec xmonad
