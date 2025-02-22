#!/bin/bash

# todo: align and text like in classic fetch

# COLORS
default='\e[0m' 
system_color='\033[38;2;242;240;0m'
picture_color='\033[38;2;114;242;0m'

# preamble
clear
user=$(whoami)
host=$(uname -n)
cpu=$(lscpu | grep "Model name" | cut -d ":" -f 2 | xargs)
os=$(grep -E '^(VERSION|NAME)=' /etc/os-release | cut -d '"' -f2)
wm=$(wmctrl -m | grep "Name:" | awk '{print $2}')
uptime=$(uptime --pretty)

# todo will make frame less hard-coded
#max_len=$(echo -e "$user\n$host\n$cpu\n$os\n$wm\n$uptime" | wc -L) 
echo -e "$picture_color";
chafa -f symbols --symbols braille -c none --size=50x25 --align mid,left ~/Pictures/home.jpg;

echo -e "$system_color";
echo -e "╔═══════════════════════════════";
echo -e "║ System";
echo -e "╠═══════════════════════════════";
echo -e "║[󰗍] user>$ $user";
echo -e "║[] host>$ $host";
echo -e "║[󰡀] cpu>$ $cpu";
echo -e "║[] os>$ $os(btw)";
echo -e "║[󱎂] wm>$ $wm";
echo -e "║[󱑂] up>$ $uptime";
echo -e "╚═══════════════════════════════";
echo -e "$default";

