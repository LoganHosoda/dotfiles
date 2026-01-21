#!/bin/bash

# Triple monitor setup
xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --pos 1920x0 \
       --output HDMI-0 --mode 1920x1080 --rate 144 --pos 0x0 \
       --output HDMI-1 --mode 1920x1080 --rate 144 --pos 960x-1080 &

# Swap control and caps lock
setxkbmap -option ctrl:nocaps

# Disable mouse acceleration (by device name)
xinput --set-prop "SteelSeries SteelSeries Aerox 3" 'libinput Accel Profile Enabled' 0, 1, 0

# Keyboard repeat rate
xset r rate 190 45

# Status bar
~/.local/bin/dwm-status.sh &


# Start dwm
exec dwm
