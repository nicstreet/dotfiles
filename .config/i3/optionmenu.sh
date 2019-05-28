#!/bin/bash

## Created By Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'Configuration' -location 3 -yoffset 32 -xoffset -10 -width 12 -hide-scrollbar -line-padding 4 -padding 20 -lines 3 -font "Misc Termsyn 8" <<< "  Network|   Themes|   Sound")"
            case "$MENU" in
                *Network) nm-connection-editor;;
                *Themes) lxappearance;;
                *Sound) pavucontrol
            esac
