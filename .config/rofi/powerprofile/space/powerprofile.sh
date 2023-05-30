#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powerprofile/space"
theme='space'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
performance='󰓅'
balanced='󰾅'
power_saver='󰾆'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$performance\n$balanced\n$power_saver" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $performance)
	    powerprofilesctl set performance
        ;;
    $balanced)
	    powerprofilesctl set balanced
        ;;
    $power_saver)
	    powerprofilesctl set power-saver
        ;;
esac
