#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/five.rasi"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        ~/bin/rofi-scripts/promptmenu.sh --yes-command "poweroff" --query "Are you sure want to Poweroff?"
        ;;
    $reboot)
        ~/bin/rofi-scripts/promptmenu.sh --yes-command "reboot" --query "Are you sure want to Reboot?"
        ;;
    $lock)
        betterlockscreen -l blur
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        ~/bin/rofi-scripts/promptmenu.sh --yes-command "openbox --exit | pkill -u $USER" --query "Logout?"
        ;;
esac

