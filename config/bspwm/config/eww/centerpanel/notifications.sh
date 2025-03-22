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
  "\(.body.data)\n\(.summary.data)\n\(.appname.data)\n\(.icon_path.data)"' | sed "s/'/’/g")

# Ahora que tenemos las notificaciones, las formateamos para el widget de Eww
if [ -z "$notifications" ]; then
  # Si no hay notificaciones, mostramos el mensaje que indica que no hay notificaciones
  echo "
    (box
        :orientation 'v'
        :space-evenly false
        (label :class 'sin-not-bell' :text '󰂚' :style {NOW-PLAYING == '' ? 'margin: 100px -20px -10px -36px' : 'margin: 40px -20px -10px -36px'})
        (label :class 'sin-not-text' :text 'Sin Notificaciones')
    )"
else
  # Crear un widget para mostrar las notificaciones
  formatted_notifications=""
  
  # Convertir las notificaciones en un array de líneas para procesarlas
  # Cada bloque de notificación contiene 4 líneas
  mapfile -t notification_lines <<< "$notifications"

  # Procesar las notificaciones en bloques de 4 líneas
  for ((i=0; i<${#notification_lines[@]}; i+=4)); do
      contenido="${notification_lines[i]}"
      titulo="${notification_lines[i+1]}"
      appname="${notification_lines[i+2]}"
      icono="${notification_lines[i+3]}"


      # Verificar si los campos están vacíos y asignar valores predeterminados si es necesario
      [ -z "$appname" ] && appname="Desconocido"
      [ -z "$icono" ] && icono="/usr/share/icons/Papirus-Dark/48x48/apps/bell.svg"

      # Formateamos cada notificación como widget
      formatted_notifications="$formatted_notifications
          (notificacion-card :titulo '$titulo' :contenido '$contenido' :imagen '$icono' :app '$appname')"
  done

  # Mostramos todas las notificaciones en un scrollable box
  echo "
        (box
            :orientation 'v'
            :spacing 10
            :space-evenly false
            $formatted_notifications
        )"
fi