#!/bin/bash
# Simple HTTP Server on port 80

d_urgency='--urgency=normal'
d_icon='--icon=system-task'
d_message="Simple HTTP Server started on Port 80."

python -m SimpleHTTPServer 80 & 

notify-send $d_urgency $d_icon '<span foreground="#b64903" font="12"><b>Simple HTTP Server started</b></span>' "$d_message"

