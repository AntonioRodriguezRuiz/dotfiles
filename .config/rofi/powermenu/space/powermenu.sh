#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/space"
theme='space'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
	    shutdown now
        ;;
    $reboot)
	    systemctl reboot
        ;;
    $lock)
	    hyprlock
        ;;
    $suspend)
	    systemctl suspend; hyprlock
        ;;
    $logout)
	    hyprctl dispatch exit
        ;;
esac
