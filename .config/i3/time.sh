#!/bin/bash
# Time sent to Dunst
d_icon='--icon="clock"'
d_urgency='--urgency=low'
dateinfo=$(date +%H:%M)
dateinfo1=$(date +"%A %d %B, %Y")
d_allinfo=" "
notify-send $d_urgency $d_icon '<span foreground="#b64903" font="48"><b>'$dateinfo'</b></span>' "$dateinfo1"
