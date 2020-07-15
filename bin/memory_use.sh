(free && ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -rn | head -n 60) | curl -F 'sprunge=<-' http://sprunge.us
