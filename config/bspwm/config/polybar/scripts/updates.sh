#!/bin/sh
#===========================================================================
#
#
#███╗   ███╗ █████╗ ██████╗ ██╗ ██████╗ ██████╗ ██████╗  ██████╗ ███╗   ███╗
#████╗ ████║██╔══██╗██╔══██╗██║██╔═══██╗██╔══██╗██╔══██╗██╔═══██╗████╗ ████║
#██╔████╔██║███████║██████╔╝██║██║   ██║██████╔╝██████╔╝██║   ██║██╔████╔██║
#██║╚██╔╝██║██╔══██║██╔══██╗██║██║   ██║██╔══██╗██╔══██╗██║   ██║██║╚██╔╝██║
#██║ ╚═╝ ██║██║  ██║██║  ██║██║╚██████╔╝██║  ██║██║  ██║╚██████╔╝██║ ╚═╝ ██║
#╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═╝ ╚═╝ ╚═════╝ ╚═╝     ╚═╝                                                                          
#                          MarioRRom's Dotfiles
#                 https://github.com/MarioRRom/bspwm-dotfiles
#===========================================================================

# Colores de Polybar
TEXT="%{F#f9e2af}"
SURFACE="%{F#313244}"
SURFACEB="%{B#313244}"
RESET="%{B-}"

#definir archivo temporal
TEMP_FILE="${HOME}/.cache/mariorrom-dotfiles/updates_count"

# Verificar si el archivo existe y no está vacio
if [ -s "$TEMP_FILE" ]; then
    updates=$(cat "$TEMP_FILE")

    # Si las actualizaciones son mayores a 0, se enseña el modulo.
    if [ "$updates" -gt 0 ]; then
        echo "${SURFACE}${TEXT}${SURFACEB}󰏔 $updates!${SURFACE}${RESET} "
    fi
else
    # Si no hay actualizaciones, no enseñar el modulo.
    echo ""
fi