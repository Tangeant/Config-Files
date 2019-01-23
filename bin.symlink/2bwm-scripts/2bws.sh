#!/usr/bin/env bash
# display workspace status
# requires wmctrl

# get the current workspace
ws=$( xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //' )

# icons

CURRENT=∙
OCCUPIED=∙
UNOCCUPIED=⋅

# colors
fg="#d8dee9"
fg1="#81a1c1"
fg2="#EBCB8B"

#  print workspaces to stdout
draw() {
    for i in {0..9}; do
        # get the number of windows in each workspace
        windows=$( wmctrl -l | cut -d ' ' -f3 | grep $i | wc -l )

        if [[ $i -eq $ws ]]
        then
            # current workspace
            echo -ne "%{F$fg}   "
        elif [[ $windows -gt "0" ]]
        then
			#occupied workspace
			echo -ne "%{F$fg2}   "
        else
            echo -ne "%{F$fg1}  • "
        fi
    done
}

draw
