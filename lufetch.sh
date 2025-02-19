#!/bin/bash

# todo: align and text like in classic fetch

# COLORS
default='\e[0m' 
user_color='\033[38;5;27m'
host_color='\033[38;5;148m' 
cpu_color='\033[38;5;105m' 
os_color='\033[38;5;51m' 
wm_color='\033[38;5;175m' 
uptime_color='\033[38;5;18m'

# preamble
clear
user=$(whoami)
host=$(uname -n)
cpu=$(lscpu | grep "Model name" | cut -d ":" -f 2 | xargs)
os=$(lsb_release -d | cut -d ':' -f 2 | xargs)
wm=$(wmctrl -m | grep "Name:" | awk '{print $2}')
uptime=$(uptime --pretty)

chafa -f symbols --symbols braille -c none --size=50x25 --align mid,left ~/Pictures/home.jpg;

echo -e "$user_color 󰗍user>$ $user $default";
echo -e "$host_color host>$ $host $default";
echo -e "$cpu_color 󰡀cpu>$ $cpu $default";
echo -e "$os_color os>$ $os $default" "(btw)";
echo -e "$wm_color 󱎂wm>$ $wm $default";
echo -e "$uptime_color 󱑂uptime>$ $uptime $default";
