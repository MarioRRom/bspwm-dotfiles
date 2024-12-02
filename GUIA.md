# 📚 GUIA DE CONFIGURACION Y USO DEL ENTORNO

Bienvenido a la guía completa para configurar y usar mi entorno de escritorio. Aquí encontrarás instrucciones detalladas sobre cómo personalizar diversos aspectos.

---

### **⌨️ Atajos de Teclado**

Los atajos de teclado están configurados a través de **sxhkd**. Puedes modificarlos en cualquier momento modificando el archivo `.config/bspwm/config/keys`. Próximamente habrá una utilidad gráfica para gestionar estos atajos.

#### Atajos de BSPWM

| Atajo                                                                                                 | Acción                                                                                  |
|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| <kbd>super</kbd> + <kbd>alt</kbd> + <kbd>q</kbd><br><kbd>super</kbd> + <kbd>alt</kbd> + <kbd>r</kbd>  | Salir de BSPWM<br>Reiniciar BSPWM                                                       |
| <kbd>super</kbd> + <kbd>q</kbd><br><kbd>super</kbd> + <kbd>shift</kbd> + <kbd>q</kbd>                 | Cerrar Ventana<br>Forzar Cierre de Ventana                                              |
| <kbd>super</kbd> + <kbd>t</kbd><br><kbd>super</kbd> + <kbd>s</kbd><br><kbd>super</kbd> + <kbd>f</kbd> | Estado 'tiled' a ventana<br>Estado 'flotante' a Ventana<br>Estado 'fulscreen' a Ventana |
| <kbd>super</kbd> + <kbd>m</kbd>                                                                       | Alternar entre layout 'tiled' y 'monocle'                                               |
| <kbd>super</kbd> + <kbd>Flechas</kbd><br><kbd>super</kbd> + <kbd>shift</kbd> + <kbd>Flechas</kbd>     | Focar ventana en la dirección<br>Mover ventana en la dirección                          |
| <kbd>super</kbd> + <kbd>1-6</kbd>                                                                     | Focar entre Escritorios                                                                 |
| <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>1-6</kbd>                                                  | Mover ventana a Escritorio                                                              |

#### Atajos Externos

| Atajo                                              | Acción                          |
|----------------------------------------------------|---------------------------------|
| <kbd>super</kbd> + <kbd>enter</kbd>                | Abrir la Terminal               |
| <kbd>super</kbd> + <kbd>d</kbd>                    | Launcher de Programas           |
| <kbd>super</kbd> + <kbd>tab</kbd>                  | Cambiar entre Ventanas          |
| <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>e</kbd> | Explorador de Archivos          |
| <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>f</kbd> | Abrir Navegador                 |
| <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>f</kbd> | Abrir Navegador                 |
| <kbd>super</kbd> + <kbd>escape</kbd>               | Recargar configuración de sxhkd |
| <kbd>alt</kbd> + <kbd>Print</kbd>                  | Captura de Pantalla             |

---

### **🖼️ Wallpapers**

Los wallpapers están ubicados en la carpeta `.config/bspwm/wallpapers/`. Puedes agregar y quitar wallpapers manualmente en esta carpeta. 

Al iniciar sesión, se tomará un wallpaper aleatorio o no, dependiendo de tu configuración a través del **Config-Editor** descrito más adelante. En un futuro, habrá una utilidad gráfica para gestionar este proceso.

Puedes cambiar rápidamente el wallpaper desde el **Control Center** o usando el siguiente comando:

```bash
SetWallpaper --change
```

---

### 🛠️ Config-Editor: Configuración Rápida del Entorno

El **Config-Editor** es una utilidad que, en el futuro, será una interfaz gráfica para gestionar la configuración de tu entorno de escritorio de manera más sencilla. De momento, la herramienta funciona a través de la terminal mediante comandos específicos. 

Es importante que al editar configuraciones, ingreses los valores correctos para evitar errores y problemas con tu sistema.

---

#### 🎛️ Comandos Disponibles

1. **Leer configuración almacenada**:
    - **Comando**:
      ```bash
      Config-Editor --leer
      ```
    - **Descripción**: Este comando lee y muestra las configuraciones almacenadas en el archivo de configuración.

2. **Editar configuración**:
    - **Comando**:
      ```bash
      Config-Editor --editar [variable] [valor]
      ```
    - **Descripción**: Cambia el valor de una configuración específica. 
    - **Ejemplo**: Para editar la ciudad del clima, usar el comando `Config-Editor --editar weathercity 1234`, donde `weathercity` es la variable y `1234` es el nuevo valor.

---

#### ⚙️ Variables Configurables

A continuación, se encuentran las variables que puedes modificar a través del **Config-Editor**. Es fundamental que ingreses los valores correctamente para evitar que el entorno funcione incorrectamente.

1. **Configuración de BSPWM**
  - **bsp_bordwidth**: Define el tamaño de los bordes de las ventanas en BSPWM.
    - **Valor**: Número (en píxeles).
    - **Ejemplo**: `Config-Editor --editar bsp_bordwidth 5`
  
  - **bsp_wingap**: Establece el espaciado entre las ventanas en BSPWM.
    - **Valor**: Número (en píxeles).
    - **Ejemplo**: `Config-Editor --editar bsp_wingap 10`

2. **Distribución de Teclado**
  - **keyboard**: Define la distribución del teclado, tal como `setxkbmap`.
    - **Valor**: Nombre de la distribución del teclado, como `latam`, `us`, etc.
    - **Ejemplo**: `Config-Editor --editar keyboard latam`

3. **Fondos de Pantalla**
  - **wallisrandom**: Activa o desactiva la selección aleatoria de un wallpaper al iniciar sesión.
    - **Valor**: `true` o `false`.
    - **Ejemplo**: `Config-Editor --editar wallisrandom true`
  
  - **wallfilename**: Define el nombre exacto del archivo de fondo de pantalla que se utilizará si la opción de wallpaper aleatorio está desactivada.
    - **Valor**: Nombre del archivo de la imagen dentro de la carpeta `wallpapers`.
    - **Ejemplo**: `Config-Editor --editar wallfilename bocci.png`

4. **Configuración de Weather**
  - **weatherkey**: La clave API proporcionada por OpenWeather.
    - **Valor**: Clave de API de OpenWeather.
    - **Ejemplo**: `Config-Editor --editar weatherkey tu_clave_api`

  - **weathercity**: La ID de la ciudad, obtenida a través de OpenWeather.
    - **Valor**: ID de la ciudad en OpenWeather.
    - **Ejemplo**: `Config-Editor --editar weathercity 1234`

  - **weatherunits**: Unidad de medida para la temperatura.
    - **Valor**: `metric` (Celsius) o `imperial` (Fahrenheit).
    - **Ejemplo**: `Config-Editor --editar weatherunits metric`

---

### ⚡ Futuro Proximo

Toda esta configuracion proximamente estará disponible en una **Utilidad Grafíca** para hacer menos engorroso todos estos ajustes, pero bueno, es lo que llevo de momento, estoy abierto a escuchar opiniones de todos ustedes o recomendaciones para mejorar juntos el entorno. Gracias por su atencion pibe. ❤️