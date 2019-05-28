#!/bin/bash

# Simple rofi menu for Power

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 3 -yoffset 32 -xoffset -10 -width 12 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "Misc Termsyn 8" <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) i3lock;;
                *Logout) i3-msg exit ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
