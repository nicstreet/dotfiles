#!/bin/sh
# [ "$(pgrep openvpn)" ]; then
if pgrep -x openvpn
then
	VPN_Status="Up"
else
	VPN_Status="Dn"
fi


sleep 2

echo $VPN_Status

while :
do
    if ! $(pgrep -x openvpn); then
        if [ $VPN_Status=="Dn" ]; then
            sleep 1
            VPN_Status="Dn"
        else
            notify-send --icon=openvpn "Open VPN" "Connection established ..."
            VPN_Status="Up"
            sleep 1
        fi
    fi

echo "After VPN Dn Check"
echo $VPN_Status
echo $(pgrep -x openvpn)
    if ! $(pgrep -x openvpn); then
        if [ $VPN_Status=="Up" ]; then
            notify-send --icon=openvpn "Open VPN" "Connectedion closed."
            VPN_Status="Dn"
            sleep 1
        else
            sleep 1
            VPN_Status="Up"
        fi
    fi

echo "After VPN Up Check"
echo $VPN_Status

done
