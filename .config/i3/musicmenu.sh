#!/bin/bash

## Created By Nic Street

MENU="$(rofi -sep "|" -dmenu -i -p 'Music Controls' -location 2 -yoffset 32 -xoffset 10 -width 12 -hide-scrollbar -line-padding 4 -padding 20 -line-margin 2 -lines 7 -font "Misc Termsyn 8" <<< " Play| Pause| Next| Previous| Shuffle| Repeat| Toggle_Mute|")"
            case "$MENU" in
                *Play) cmus-remote --play;;
                *Pause) cmus-remote --pause;;
                *Next) cmus-remote --next ;;
                *Previous) cmus-remote --prev;;
                *Shuffle) cmus-remote --shuffle;;
                *Repeat) cmus-remote --repeat;;
                *Toggle_Mute) pactl set-sink-mute 1 toggle && pactl set-sink-mute 2 toggle;;
            esac
