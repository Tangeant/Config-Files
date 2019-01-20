#!/bin/sh
#
# Nord color scheme for the Linux console
# Executable script to send the required escape sequences to the terminal.
#
# Author: Chris Terrio <cterrio@gmail.com>
# Based on Solarized Linux Console by Alexandre de Verteuil
# Date: 2019-01-15
#
# See man 4 console_codes for more information.

$TERM = linux
echo() {
  env echo $*
}

printf "\033]P03b4252" # Black
printf "\033]P1bf616a"      # Red
printf "\033]P2a3be8c"    # Green
printf "\033]P3ebcb8b"   # Brown
printf "\033]P481a1c1"     # Blue
printf "\033]P5b48ead"  # Magenta
printf "\033]P688c0d0"     # Cyan
printf "\033]P7e5e9f0"  # White
printf "\033]P84c566a"
printf "\033]P9D08770"
printf "\033]PAa3be8c"
printf "\033]PBebcb8b"
printf "\033]PC88c0d0"
printf "\033]PDb48ead"
printf "\033]PE8fbcbb"
printf "\033]PFeceff4"
# get rid of artifacts
  clear
