# My-i3wm-Config

Backup para no tener que estar reinstalando todo y buscarlo.

Requisitos
==========
Algunas de las aplicaciones listadas se deberán instalar a mano:
1. *feh* (imagen de fondo)
2. *compton* (transparencia de terminal
3. *i3blocks* (otro status menu)
4. *rofi* (buscador de aplicaciones)
5. *i3lock-fancy* (Para que se vea lock "cool")
6. Chromium (opcional)

**NOTA**: Varias de las aplicaciones, pueden ser o
no necesariamente esenciales. Las primeras 5 son
las que considero esenciales para disfrutar de una 
mejor experiencia con **i3wm**.

INSTALACIÓN
===========
Para instalar *i3wm*, ingresar lo siguiente por terminal:
	`
	  sudo apt-get install i3
	`

Para instalar *i3blocks*, ingresar por terminal lo siguiente:

	`
	  sudo apt-get install i3blocks
	`	

**ATENCIÓN**: la configuración de i3 la vamos a crear en el /home del usuario.
		La carpeta debe crearse como .i3, y debemos importar las configuraciones
		en dicha carpeta.

Instalación opcional
====================
Básico para desarrolladores de C "Fiubenses":
	
	`
	   sudo apt install build-essential valgrind manpages-dev gdb

	`

Instalando i3-gaps
==================
Para instalar i3-gaps, se tienen que cumplir las siguientes dependencias:


  ```
    sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libsnack2-dev libxcb-shape0-dev autoconf libev-dev build-essential git
  ```

Luego, deberán reiniciar su equipo.
Después de reiniciar el equipo, tienen que copiar el repositorio de [i3-gaps Airblender](git clone https://www.github.com/Airblader/i3 i3-gaps)

Una vez clonado el repositorio, hacemos lo siguiente:


```
	cd i3-gaps
	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make && sudo make install

```

Después de concluida la instalación, deberán agregar la configuración, al
archivo de configuración de *i3*. ¿Cómo lo hacemos?

Nos dirigimos a ```~/.config/i3/config ``` (no al que tienen, si es que lo
hicieron, a ```~/.i3``` porque no se los va a leer), y al final de todo, copiamos
y pegamos lo siguiente:


```

#############################
### settings for i3-gaps: ###
#############################

# Set inner/outer gaps
#for_window [class="^.*"] border pixel 0
gaps inner 12
gaps outer 1

# Additionally, you can issue commands with the following syntax. This is useful to bind keys to changing the gap size.
# gaps inner|outer current|all set|plus|minus <px>
# gaps inner all set 10
# gaps outer all plus 5

# Smart gaps (gaps used if only more than one container on the workspace)
#smart_gaps on

# Smart borders (draw borders around container only if it is not the only container on this workspace) 
# on|no_gaps (on=always activate and no_gaps=only activate if the gap size to the edge of the screen is 0)
smart_borders on

# Press $mod+Shift+g to enter the gap mode. Choose o or i for modifying outer/inner gaps. Press one of + / - (in-/decrement for current workspace) or 0 (remove gaps for current workspace). If you also press Shift with these keys, the change will be global for all workspaces.
set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

```

Una vez terminado, guardamos y reiniciamos *i3*. (con mod+shit+r)

Algunos enlaces útiles
======================

1. [Repositorio de Rofi](https://github.com/davatorium/rofi)
	* **NOTA**: Se puede instalar mediante:
		
			`
				sudo apt-get install rofi
			`
		
  	El principal problema es que, desde la instlación por línea de comandos,
			se tiene problemas con el layout con algunos temas.
			Para ello, pueden instarlo a mano, y luego clonan el repositorio,
			para copiar todos los temas bajados del repositorio, en su carpeta
			de temas **themes** de rofi, que está en la siguiente ruta:
	
		
			`
				/usr/share/rofi/themes
		
	    	`
					
2. [Mutt - Cliente de Mail por Terminal](https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/)
3. [Vimplug - Para poner plugins a VIM](https://www.ostechnix.com/vim-plug-a-minimalist-vim-plugin-manager/)
4. [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
5. [SimpleDesktops - Fondos de Pantalla Minimalistas](http://simpledesktops.com/)
6. [Kthulu120 Themes](https://github.com/Kthulu120/i3wm-themes) (requiere i3-gaps instalado)

SOLO PARA XFCE4
===============
Para los que dispongan de una distro Xubuntu, o con el entorno *xfce4* (en tengan instalado *xfce4-terminal*),
podrán ver que el tema *Solarized Dark* tiene ciertos problemas. Para poder agregarle distintos temas, es
necesario hacer los siguientes cambios:

1. Primero clonamos el repositorio con los temas para *xfce4-terminal* con la siguiente línea:
	
	```
		git clone https://github.com/afq984/base16-xfce4-terminal.git
	```
2. Una vez clonado, nos dirigimos a la siguiente ruta, y creamos las carpetas *terminal/colorschemes*:
	
	```
		cd ~/.local/share/xfce4
		mkdir -p terminal/colorschemes
	```		
3. Después de creada las carpetas, nos dirigimos a la ubicación del repositorio descargado, y escribimos lo siguiente:

	```
		cp -r colorschemes ~/.local/share/xfce4/terminal
	```

Y listo, ya tendremos nuestros temas para esta terminal.

(Aclaración: Puede llegar a ser pesado este cambio, así que cuidado)	