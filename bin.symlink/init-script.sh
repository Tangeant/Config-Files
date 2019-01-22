##Init script for 2bwm
desktop=$(echo $DESKTOP_SESSION | cut -c 22-)

#Some ways to set your wallpaper besides variety or nitrogen
variety &
#xfdesktop &

if $desktop = 2bwm; then
#start the conky to learn the shortcuts for 2 bwm
	feh --bg-scale ~/.bin/2bwm-scripts/wall.png &
	conky -c $HOME/.bin/2bwm-scripts/system-overview &
	compton --config $HOME/.bin/2bwm-scripts/compton.conf &
	#starting utility applications at boot time
	nm-applet &
	pamac-tray &
	xfce4-power-manager &
	numlockx on &
	blueberry-tray &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	/usr/lib/xfce4/notifyd/xfce4-notifyd &

	fi

#run polybar, but for xmonad run from autostart
if $desktop != xmonad; then
	$HOME/.config/polybar/launch.sh &
	$HOME/.bin/test.sh &
	fi

calcurse -d &
