#!/bin/bash

## Created By Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'Configuration' -location 0 -yoffset 32 -xoffset -10 -width 12 -hide-scrollbar -line-padding 4 -padding 20 -lines 3 -font "San Francisco Display Medium 10" <<< "Network|Themes|Sound")"
            case "$MENU" in
                *Network) nm-connection-editor;;
                *Themes) lxappearance;;
                *Sound) pavucontrol
            esac
