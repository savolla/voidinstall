#!/bin/bash
xrandr -s 1920x1080
setxkbmap tr
feh --bg-scale ~/resource/wallpaper/wallpaper
udiskie &
# xset r rate 150 30
# xbacklight -set 50
exec dwm

