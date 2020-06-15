--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/christ/.wallpaper/gradient.jpg"

-- Special
background="#4a7b91"
foreground="#c7d7f2"
cursor="#c7d7f2"

-- Colors
color0="#4a7b91"
color1="#9DC1F6"
color2="#9FC2F6"
color3="#9EC2F6"
color4="#98C4F6"
color5="#9AC4F6"
color6="#A0C0F6"
color7="#c7d7f2"
color8="#8b96a9"
color9="#9DC1F6"
color10="#9FC2F6"
color11="#9EC2F6"
color12="#98C4F6"
color13="#9AC4F6"
color14="#A0C0F6"
color15="#c7d7f2"