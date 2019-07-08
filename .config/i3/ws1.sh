#!/bin/bash
# Script to load i3 workspace template and assign applications

i3-msg "workspace 1; append_layout ~/.config/i3/workspace-1.json"
terminator -g $HOME/.config/terminator/config -p streety

