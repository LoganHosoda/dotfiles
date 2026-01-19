#!/bin/bash

# Disable mouse acceleration
xinput --set-prop $(xinput list | grep -i 'pointer' | grep -o 'id=[0-9]*' | grep -o '[0-9]*' | head -1) 'libinput Accel Profile Enabled' 0, 1

# Keyboard repeat rate
xset r rate 200 40

# Status bar
~/.local/bin/dwm-status.sh &

# Swap control and caps lock
setxkbmap -option crtl:swapcaps

# Start dwm
exec dwm
