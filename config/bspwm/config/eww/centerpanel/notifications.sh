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

# Cargar Json de Notificaciones
json_dunst=$(dunstctl history)


# Extraer los datos de las notificaciones
notifications=$(echo "$json_dunst" | jq -r '.data[0][] |
  "\(.body.data)\n\(.summary.data)\n\(.appname.data)\n\(.icon_path.data)"')


# Ahora que tenemos las notificaciones, las formateamos para el widget de Eww
if [ -z "$notifications" ]; then
  # Si no hay notificaciones, mostramos el mensaje que indica que no hay notificaciones
  echo "
    (box
        :orientation 'v'
        :space-evenly true
        :height 492
        :width 320
        :spacing -300
        (label :class 'sin-not-bell' :text '󰂚')
        (label :class 'sin-not-text' :text 'Sin Notificaciones')
    )"
else
  # Crear un widget para mostrar las notificaciones
  formatted_notifications=""
  
  # Leemos todas las notificaciones
  # Convertir las notificaciones en un array de líneas para procesarlas
  # Cada bloque de notificación contiene 4 líneas, que se asignan de manera ordenada
  while IFS= read -r contenido && IFS= read -r titulo && IFS= read -r appname && IFS= read -r icono; do
    # Formateamos cada notificación como widget
    formatted_notifications="$formatted_notifications
        (notificacion-card :titulo '$titulo' :contenido '$contenido' :imagen '$icono' :app '$appname')"
  done <<< "$notifications"

  # Mostramos todas las notificaciones en un scrollable box
  echo "
    (scroll
        :vscroll true
        :height 492
        :width 320
        (box
            :class 'scrollbox'
            :orientation 'v'
            :spacing 10
            :space-evenly false
            $formatted_notifications
        )
    )"
fi