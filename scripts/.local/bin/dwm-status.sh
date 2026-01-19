#!/bin/bash

while true; do
	# Date and time
	datetime=$(date '+%a %b %d %H:%M')
	
	# Battery
	battery=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
	bat_status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)
	if [ -n "$battery" ]; then
		if [ "$bat_status" = "Charging" ]; then
			bat_icon="C"
		else
			bat_icon="N/C"
		fi
		bat_info="$bat_icon $battery%"
	else
		bat_info=""
	fi

	# Set status
	xsetroot -name " $bat_info | $datetime "

	sleep 1
done
