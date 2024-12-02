# **Guía de Instalación de los Dotfiles de MarioRRom**

Esta guía te llevará paso a paso para instalar mis dotfiles de BSPWM en una máquina con Arch Linux. Si ya tienes un sistema ArchLinux instalado, puedes saltarte la instalación de Arch y seguir desde la sección de instalación de Xorg.

---

### **1. Instalación de Arch Linux (Si aún no lo tienes instalado)**

Si aún no tienes Arch Linux, sigue la sección 1 de la siguiente guía de instalación de Arch:

[Guía de instalación de Arch Linux](https://github.com/silentz/arch-linux-install-guide?tab=readme-ov-file#----section-01-step-by-step-guide-of-installing-arch-linux-on-your-hardware-)

---

### **2. Instalación de Xorg**

Instala los paquetes básicos de Xorg:

```bash
sudo pacman -S xorg xorg-apps xorg-xinit xorg-xlsfonts xdotool xclip xsel
```

---


### **3. Instalación y configuración de GDM**

Instala GDM (GNOME Display Manager) y habilítalo en `systemd`:

```bash
sudo pacman -S gdm
sudo systemctl enable gdm
```

> **Nota:** GDM instala paquetes esenciales como Pipewire y Polkit-Gnome, que son necesarios para mis dotfiles.

---

### **4. Instalación de Alacritty**

Instala Alacritty, el terminal que utilizo:

```bash
sudo pacman -S alacritty
```

---

### **5. Arrancar GDM**

Inicia GDM para acceder a un entorno cómodo para continuar con la instalación:

```bash
sudo systemctl start gdm
```

Inicia sesión en gnome-xorg a través de el enganaje en la parte inferior derecha (gnome no me funcionó, por eso usé gnome-xorg). Esto te proporcionará un entorno con el que trabajar a partir de aquí.

> **Nota:** Puedes usar `setxkbmap` en la terminal de Alacritty para configurar tu distribución de teclado, por ejemplo, `setxkbmap latam`.

---

### **6. Instalación de Paru (AUR Helper)**

Si aún no tienes Git, instálalo:

```bash
sudo pacman -S git
```

> **Nota:** Si ya tienes Git instalado, puedes omitir este paso.

Luego, instala Paru para instalar paquetes desde AUR:

```bash
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -si
```

> **Nota:** Necesitarás tener instalado el paquete `base-devel` para poder compilar Paru. Si no lo tienes, instálalo con:

```bash
sudo pacman -S base-devel
```

---

### **7. Instalación de dependencias**

Primero, instala los paquetes esenciales para que mis dotfiles funcionen correctamente:

```bash
sudo pacman -S bspwm sxhkd polybar picom alacritty rofi feh zsh lsd zsh-syntax-highlighting zsh-autosuggestions \
playerctl dunst jq polkit-gnome nautilus flameshot pacman-contrib xsettingsd brightnessctl redshift \
papirus-icon-theme capitaine-cursors xorg-xsetroot arandr xdotool dex
```

#### **Dependencias en AUR**

Instala `eww` desde AUR:

```bash
paru -S eww
```

---

### **8. Instalación del tema GTK Catppuccin Mocha**

Mis dotfiles están configurados para usar el esquema de colores de **Catppuccin Mocha**. Para lograr una armonía en todo el sistema, instala el tema GTK de Catppuccin siguiendo la guía de instalación:

[Guía de instalación de Catppuccin GTK](https://github.com/catppuccin/gtk/blob/main/docs/USAGE.md)

Usa el script proporcionado en su github para instalar el tema:

```bash
python3 install.py mocha sky
```

Luego, puedes habilitar el soporte para GTK4:

```bash
ln -sf $HOME/.local/share/themes/catppuccin-mocha-sky-standard+default/gtk-4.0 $HOME/.config/
```

---

### **9. Clonar mi repositorio de dotfiles**

Ahora clona mi repositorio de dotfiles:

```bash
git clone https://github.com/MarioRRom/bspwm-dotfiles.git
```

Entra en la carpeta del repositorio:

```bash
cd bspwm-dotfiles
```

---

### **10. Instalación de mis dotfiles**

Copia toda mi configuración a tu entorno. Recuerda hacer un backup si ya tenías configuraciones previas.

```bash
mkdir -p $HOME/.config && cp -r ./config/* $HOME/.config/
mkdir -p $HOME/.local/share/fonts && cp ./fonts/fonts.zip $HOME/.local/share/fonts/
cp -r ./home/. $HOME/
```

---

### **11. Instalación de fuentes**

Ahora, descomprime las fuentes que copiaste anteriormente:

```bash
cd $HOME/.local/share/fonts/
unzip fonts.zip
rm fonts.zip
```

Y actualiza la caché de fuentes para cargarlas correctamente:

```bash
fc-cache -fv
```

---

### **12. Iniciar sesión en BSPWM**

Finalmente, cierra sesión, cambia a **BSPWM** en GDM, e inicia sesión. Si todo salió bien, deberías tener tu entorno listo para usar. ¡Disfruta de tu nuevo escritorio!

---

### **13. Herramientas adicionales recomendadas**

Estos son algunos paquetes adicionales que puedes instalar para mejorar la funcionalidad de tu sistema:

```bash
sudo pacman -S firefox            # Navegador web
sudo pacman -S baobab             # Analizador de espacio en disco
sudo pacman -S vlc                # Reproductor de audio y video
sudo pacman -S file-roller        # Gestor de archivos comprimidos
sudo pacman -S gnome-calculator   # Calculadora
sudo pacman -S gnome-system-monitor # Monitor del sistema
sudo pacman -S gnome-text-editor  # Editor de texto rápido
```

---

**¡Eso es todo! Si todo salió bien, ahora tienes mi entorno BSPWM configurado y listo para usarse. Si tienes problemas o dudas, no dudes en abrir un issue en el repositorio. ¡Disfruta!**  