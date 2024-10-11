#!/bin/sh
#===========================================================================
#
#
#███╗   ███╗ █████╗ ██████╗ ██╗ ██████╗ ██████╗ ██████╗  ██████╗ ███╗   ███╗
#████╗ ████║██╔══██╗██╔══██╗██║██╔═══██╗██╔══██╗██╔══██╗██╔═══██╗████╗ ████║
#██╔████╔██║███████║██████╔╝██║██║   ██║██████╔╝██████╔╝██║   ██║██╔████╔██║
#██║╚██╔╝██║██╔══██║██╔══██╗██║██║   ██║██╔══██╗██╔══██╗██║   ██║██║╚██╔╝██║
#██║ ╚═╝ ██║██║  ██║██║  ██║██║╚██████╔╝██║  ██║██║  ██║╚██████╔╝██║ ╚═╝ ██║
#╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝                                                                          
#                          MarioRRom's Dotfiles
#
#===========================================================================

# Colores de Polybar
PLAYING="%{F#a6e3a1}"
PAUSED="%{F#f9e2af}"
MAX_LENGTH=20  # Número máximo de caracteres visibles

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]; then
    title=$(playerctl metadata title)
    
    # Deslizar texto si es demasiado largo
    if [ ${#title} -gt $MAX_LENGTH ]; then
        offset=$(( ($(date +%s) % ${#title}) + 1 ))
        truncated_text="${title:offset}"
        if [ "${#truncated_text}" -lt $MAX_LENGTH ]; then
            truncated_text="${truncated_text} ${title}"
        fi
        truncated_text="${truncated_text:0:$MAX_LENGTH}"
    else
        truncated_text="$title"
    fi

    if [ "$player_status" = "Playing" ]; then
        echo "${PLAYING}󰎆 $truncated_text "
    else
        echo "${PAUSED}󰏤 $truncated_text"
    fi
else
    echo ""
fi