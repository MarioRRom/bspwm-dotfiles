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

API_KEY="b412dae84b266e46cbc31c1d476f03a7" # Puedes crear una clave API en el sitio de OpenWeather
CITY_ID="3841956" # Puedes encontrar el ID de tu ciudad en el sitio de OpenWeather
UNITS="metric"  # Usa "imperial" para Fahrenheit

WEATHER=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&units=$UNITS&appid=$API_KEY")

if [ -n "$WEATHER" ]; then
    TEMP=$(echo $WEATHER | jq '.main.temp' | xargs printf "%.0f")
    ICON_CODE=$(echo $WEATHER | jq -r '.weather[0].icon')
    DESCRIPTION=$(echo $WEATHER | jq -r '.weather[0].description')

    # Definir iconos basados en el código de icono de OpenWeather
    case $ICON_CODE in
        01d) ICON="󰖨" ;;  # Sol claro de día
        01n) ICON="" ;;  # Noche despejada
        02d | 02n) ICON="󰅟" ;;  # Parcialmente nublado
        03d | 03n) ICON="󰅟" ;;  # Nublado
        04d | 04n) ICON="󰅟" ;;  # Nublado
        09d | 09n) ICON="" ;;  # Lluvia moderada
        10d) ICON="" ;;  # Lluvia de día
        10n) ICON="" ;;  # Lluvia de noche
        11d | 11n) ICON="" ;;  # Tormenta
        13d | 13n) ICON="" ;;  # Nieve
        50d | 50n) ICON="" ;;  # Niebla
        *) ICON="" ;;  # Desconocido
    esac

    echo " $ICON $TEMP°C"
else
    echo ""
fi