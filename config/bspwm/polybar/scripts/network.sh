#!/bin/bash

# Interfaces de red
WIFI_INTERFACE="wlp1s0"  # Cambiá por tu interfaz Wi-Fi si es diferente
ETH_INTERFACE="enp2s0"   # Cambiá por tu interfaz Ethernet si es diferente

# Obtener estado de conexión de Wi-Fi
WIFI_STATUS=$(cat /sys/class/net/$WIFI_INTERFACE/operstate)

# Obtener la intensidad de la señal Wi-Fi (en porcentaje)
WIFI_SIGNAL=$(awk 'NR==3 {printf "%d", ($3 * 100 / 70)}' /proc/net/wireless)

# Obtener estado de conexión de Ethernet
ETH_STATUS=$(cat /sys/class/net/$ETH_INTERFACE/operstate)

# Mostrar el estado de la red
if [ "$ETH_STATUS" = "up" ]; then
    # Si Ethernet está conectado, mostrar icono de Ethernet
    echo "󰈀"
elif [ "$WIFI_STATUS" = "up" ]; then
    # Si Wi-Fi está conectado, mostrar icono según la intensidad de la señal
    if [ "$WIFI_SIGNAL" -ge 75 ]; then
        ICON="󰤨"  # Excelente señal
    elif [ "$WIFI_SIGNAL" -ge 50 ]; then
        ICON="󰤥"  # Buena señal
    elif [ "$WIFI_SIGNAL" -ge 25 ]; then
        ICON="󰤢"  # Señal media
    else
        ICON="󰤟"  # Señal baja
    fi
    echo "$ICON"
else
    # Si ninguna conexión está activa, mostrar icono de desconexión
    echo "󰤭"
fi