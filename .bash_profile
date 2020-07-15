#
# ~/.bash_profile
#
# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
