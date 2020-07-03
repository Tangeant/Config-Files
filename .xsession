#!/usr/bin/bash
source "$HOME/.cache/wal/colors.sh"
setxkbmap -option "caps:swapescape" &

export MICRO_TRUECOLOR=1
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

calcurse --daemon &
onedrive --monitor --confdir "~/.config/onedrivePersonal" &
mpd &
urxvtd &
