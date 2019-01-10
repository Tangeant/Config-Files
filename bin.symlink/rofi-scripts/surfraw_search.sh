#!/bin/bash

sr $(sr -elvi | tail -n +2 | cut -s -f1 | rofi -p "surfraw" -dmenu)
