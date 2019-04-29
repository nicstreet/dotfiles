#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar left -c /root/.config/polybar/polybar.config &
# polybar right -c /root/.config/i3/polybar.config &
# polybar laptop -c /root/.config/i3/polybar.config &

echo "Bars launched..."
