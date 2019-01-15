#!/bin/sh
#
# Nord color scheme for the Linux console
# Executable script to send the required escape sequences to the terminal.
#
# Author: Chris Terrio <cterrio@gmail.com>
# Based on Solarized Linux Console by Alexandre de Verteuil
# Date: 2019-01-15
#
# This file should be placed in the PATH, such as "/usr/local/bin".
# It will be executed from the console-solarized@.service unit
# when a getty@.service unit is instantiated.
#
# See man 4 console_codes for more information.

$TERM = linux
echo() {
  env echo $*
}

printf "\033]P02e3440" # Black
printf "\033]P188c0d0"      # Red
printf "\033]P2bf616a"    # Green
printf "\033]P35e81ac"   # Brown
printf "\033]P4ebcb8b"     # Blue
printf "\033]P5a3be8c"  # Magenta
printf "\033]P6d08770"     # Cyan
printf "\033]P7e5e9f0"  # White
printf "\033]P84c566a"
printf "\033]P988c0d0"
printf "\033]PB5e81ac"
printf "\033]PAbf616a"
printf "\033]PCebcb8b"
printf "\033]PDa3be8c"
printf "\033]PEd08770"
printf "\033]PF8fbcbb"
# get rid of artifacts
  clear
