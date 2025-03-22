#!/bin/bash
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


# Extraer los datos de la canción actual usando playerctl
artista=$(playerctl metadata artist 2>/dev/null)
titulo=$(playerctl metadata title 2>/dev/null)
imagen=$(playerctl metadata mpris:artUrl 2>/dev/null)
status=$(playerctl status 2>/dev/null)
color=$(convert "$imagen" -resize 100x100 -colors 1 -format "%c" histogram:info:- | sort -n | head -n 1 | awk '{print $3}')

# Determinar el icono de estado
if [ "$status" == "Playing" ]; then
  icono_estado="󰏥"
else
  icono_estado=""
fi

# Verificar si hay una canción reproduciéndose
if [ -n "$artista" ] && [ -n "$titulo" ]; then
  echo "(now-playing-card :artista '$artista' :titulo '$titulo' :imagen '$imagen' :status '$icono_estado' :bgcolor '$color')"
else
  echo ""
fi