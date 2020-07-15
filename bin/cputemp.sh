#!/bin/bash
temp1=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input`
echo `expr $temp1 / 1000`
