#!/bin/bash
# Start HTB open VPN
sudo openvpn ~/Dropbox/working/intersect.ovpn &

sleep 5 

if ! $(pgrep -x openvpn); then
    notify-send --urgency=normal --icon=openvpn '<span foreground="#b4430e" font="12"><b>Open VPN</b></span>' 'Connection established ...'
fi
