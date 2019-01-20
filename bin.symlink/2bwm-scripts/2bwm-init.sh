#!/bin/bash

##Init script for 2bwm

#Some ways to set your wallpaper besides variety or nitrogen
run variety &
run xfdesktop &
feh --bg-scale ~/.bin/2bwm-scripts/wall.jpg &
#start the conky to learn the shortcuts
(sleep 6; conky -c $HOME/.bim/2bwm-scripts/system-overview) &

(sleep 6; run $HOME/.config/polybar/launch.sh) &

#starting utility applications at boot time
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
compton --config $HOME/.bin/2bwm-scripts/compton.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run calcurse -d &
