#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    ifconfig tun0 | grep 'inet' | cut -d: -f2 | awk '{print $2}'
else
    echo "VPN Disconnected"
fi
