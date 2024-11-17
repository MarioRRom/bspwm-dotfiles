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

# Directorio temporal donde se guardan los datos del clima
TEMP_DIR="${HOME}/.cache/weather"

# Leer los valores de los archivos
ICON=$(cat "$TEMP_DIR/icono" 2>/dev/null || echo "?")
TEMP=$(cat "$TEMP_DIR/temp" 2>/dev/null || echo "N/A")
COLOR=$(cat "$TEMP_DIR/color" 2>/dev/null || echo "#FFFFFF")

# Mostrar el icono y la temperatura
# Usamos printf para aplicar el color al icono
echo " "%{F$COLOR}"$ICON $TEMP"