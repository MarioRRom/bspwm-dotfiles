#!/bin/sh

# Colores de Polybar
TEXT="%{F#f9e2af}"
SURFACE="%{F#313244}"
SURFACEB="%{B#313244}"
RESET="%{B-}"

updates=$(checkupdates 2> /dev/null | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "${SURFACE}${TEXT}${SURFACEB}󰏔 $updates!${SURFACE}${RESET} "
else
    echo ""
fi