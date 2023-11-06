#!/bin/bash
SCREEN_RESOLUTION_X=1920
SCREEN_RESOLUTION_Y=1080
KEYBOARD_LANGUAGE="tr"
KEY_PRESS_DELAY=180
KEYS_PER_SECOND=60
VIRTUAL_MACHINE_NAME="programming"
PATH_TO_WALLPAPER="$HOME/resource/wallpaper/wallpaper"

xrandr -s "$SCREEN_RESOLUTION_X"x"$SCREEN_RESOLUTION_Y" # set resolution (vm only)
# xrandr --output HDMI-1-4 --auto --right-of eDP1 # second monitor support
setxkbmap "$KEYBOARD_LANGUAGE"      # set keyboard layout to turkish
feh --bg-scale "$PATH_TO_WALLPAPER" # set wallpaper
udiskie &                           # enable automounting
# redshift &                                            # protect my eyes
# pipewire &
# pipewire-pulse &
# xbacklight -set 30
unclutter --timeout 15 & # remove mouse cursor
spice-vdagent &          # enable shared clipboard between host and vm
xprop -root -set WM_NAME $VIRTUAL_MACHINE_NAME
xset r rate "$KEY_PRESS_DELAY" "$KEYS_PER_SECOND"
exec dwm # execute window manager
