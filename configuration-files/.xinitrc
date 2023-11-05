#!/bin/bash
# xrandr -s 1920x1080                           # set resolution (vm only)
# xrandr --output HDMI-1-4 --auto --right-of eDP1 # second monitor support
setxkbmap tr                                  # set keyboard layout to turkish
feh --bg-scale ~/resource/wallpaper/wallpaper # set wallpaper
udiskie &                                     # enable automounting
spice-vdagent &                               # enable shared clipboard between host and vm
# redshift &				      # protect my eyes
unclutter --timeout 15 & 		      # remove mouse cursor
# pipewire &
# pipewire-pulse &
# xbacklight -set 30
exec dwm                                      # execute window manager
# xset r rate 150 30
