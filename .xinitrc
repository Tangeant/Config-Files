#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
source "$HOME/.cache/wal/colors.sh"

xsetroot -cursor_name left_ptr &
setxkbmap -option "caps:swapescape" &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export MICRO_TRUECOLOR=1

onedrive --monitor --confdir="~/.config/onedrivePersonal" &

calcurse --daemon &
urxvtd &

sxhkd -c ~/.config/sxhkd/common-keys &

# Window Managers
session=${1:-2bwm}

case $session in
    2bwm ) #polybar -r mainbar-2bwm -c $HOME/.config/polybar/config &
    #polybar -r 2ndbar-2bwm -c $HOME/.config/polybar/config &
    #feh --bg-scale ~/bin/2bwm-scripts/wall.png &
	#conky -c $HOME/bin/2bwm-scripts/system-overview &
	 picom -b --config $HOME/bin/2bwm-scripts/compton.conf &
    2bwm && exec tabbed -c -r 2 st -w ' ' -e 'zsh -ic tmux'\
    ;;
    bsp|bspwm ) exec bspwm
    ;;
    herb|herbstluftwm ) exec herbstluftwm
    ;;
esac
