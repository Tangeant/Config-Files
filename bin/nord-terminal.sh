#!/bin/sh
#
# Nord color scheme for the Linux console
# Executable script to send the required escape sequences to the terminal.
#
# Author: Chris Terrio <cterrio@gmail.com>
# Based on Nord Theme by Arctic Ice Studios
# Date: 2020-06-16
#
# See man 4 console_codes for more information.

if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P02e3440
  \e]P1bf616a
  \e]P2a3be8c
  \e]P3ebcb8b
  \e]P481a1c1
  \e]P5b48ead
  \e]P688c0d0
  \e]P7e5e9f0
  \e]P84c566a
  \e]P9bf616a
  \e]PAa3be8c
  \e]PBebcb8b
  \e]PC81a1c1
  \e]PDb48ead
  \e]PE8fbcbb
  \e]PFeceff4
  "
  # get rid of artifacts
  clear
fi
