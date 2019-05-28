#!/bin/bash
# Simple script to display network information in Dunst

lanip=`ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`

if [ "$(pgrep openvpn)" ]
then
    vpnip=`ifconfig tun0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
else
    vpnip='disconnected'
fi

nssum="Current Connections:"
nsbody="LAN:$lanip\nVPN:$vpnip"
notify-send --expire-time=2000 --icon=network-wired-solid "Current Connections:" $nsbody
