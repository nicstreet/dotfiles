#!/bin/bash
# System Information sent to Dunst

d_urgency='--urgency=normal'
d_icon='--icon=system-task'

sysinfo1="Hostname: "$(hostname)
sysinfo2="OS: "$(lsb_release -ds)
sysinfo3="Kernel: "$(uname -sr)
sysinfo4="Uptime: "$(uptime -p | sed 's/up //')
sysinfo="\r$sysinfo1\r$sysinfo2\r$sysinfo3\r$sysinfo4\r\r$meminfo1"

meminfo1=$(cat /proc/meminfo | grep MemTotal | awk -F ' ' '{ print $2 }')
meminfo2=$(cat /proc/meminfo | grep MemFree | awk -F ' ' '{ print $2 }')
mempctg=$(( meminfo2 *100 / meminfo1 ))
memfree=$((meminfo2 / 1024))
memtotal=$((meminfo1 / 1024))
meminfo="Memory: "$mempctg" % free [ $memfree of $memtotal ]\r"

cpuinfo="CPU: `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'` %\r"

hddinfo="HDD: `df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1` %\r\r"

lanip=`ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`

if [ "$(pgrep openvpn)" ]
then
    vpnip=`ifconfig tun0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'\/r`
else
    vpnip='disconnected\r'
fi

netinfo="LAN:$lanip\nVPN:$vpnip"

d_allinfo="$sysinfo$meminfo$cpuinfo$hddinfo$netinfo"

notify-send $d_icon $d_urgency '<span foreground="#b64903" font="12"><b>System Information</b></span>' "$d_allinfo"
#notify-send --urgency=normal --icon=system-task '<span foreground="#b4430e" font="12"><b>System Information</b></span>' "$sysinfo1\r$sysinfo2\r$sysinfo3\r$sysinfo4\r\r$meminfo1"

