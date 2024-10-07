#!/bin/sh

is_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -qE 'yes|sí')

if [ $? -eq 0 ]; then
    echo "%{F#f9e2af}󰍭"
else
    echo "%{F#f38ba8}󰍬"
fi
