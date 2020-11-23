# Lorblak-Dotfiles

Con gusto, presento mis dotfiles, para todos aquellos que vieron mis capturas en `Linux Latinoamérica` y `XUnix`. La mayor parte del trabajo se hizo en AntiX, y estas configuraciones pretenden ser aplicables de distribuciones Debian y derivados.

Prerrequisitos
==============
Deben tener instalado lo siguiente:
## Paquetes generales
	
	   sudo apt install build-essential valgrind manpages-dev gdb feh compton rofi i3lock-fancy cmatrix htop pcmanfm vim neofetch

## Para i3wm

Para una instalación de *i3wm*, solo deben ingresar lo siguiente:

		sudo apt-get install i3wm



## Opcional: i3-gaps
Para instalar i3-gaps, se tienen que cumplir las siguientes dependencias:

		sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libsnack2-dev libxcb-shape0-dev autoconf libev-dev build-essential git

Luego, deberán reiniciar su equipo.
Después de reiniciar el equipo, tienen que copiar el repositorio de [i3-gaps Airblender](git clone https://www.github.com/Airblader/i3 i3-gaps)

Una vez clonado el repositorio, hacemos lo siguiente:

		cd i3-gaps
		autoreconf --force --install
		rm -rf build/
		mkdir -p build && cd build/
		../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
		make && sudo make install

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


## Para bspwm
Las configuraciones solo trabajan con `bspwm`, `sxhkd` y `polybar`

		sudo apt-get install bspwm sxhkd

**NOTA**: Para los que usen Debian 10 o derivados, deben tener en cuenta que la instalación les va a traer la versión `0.9.5`, el cuál viene con un bug que se resolvió en versiones posteriores. Por eso, antes de realizar la instalación de `bspwm`, asegúrense de tener habilitado el siguiente repositorio en su archivo `/etc/apt/sources.list`

		 deb http://ftp.de.debian.org/debian sid main 

Para hacer la instalación sin tener que agregar Sid, solamente ingresar en terminal `sudo apt-get update && sudo apt-get install bspwm`, y después borrar del repositorio la línea que agregaron en `sources.list`

##	Eligiendo una barra
La barra que se deberá usar dependerá si está disponible para el dotfile que se elija. La mayor parte del trabajo fue pensado para i3wm. En caso de bspwm, por el momento, se trabajará con polybar.

###	i3blocks
Para instalar i3blocks, y poder configurarlo:

		sudo apt-get install i3blocks
		mkdir ~/.i3 && cp /etc/i3blocks.conf ~/.i3

Se tendrá una copia en el directorio `~/.i3`, desde el cuál, podrán usarlo con i3, al agregar lo siguiente en `~/.config/i3/config`:

		bar {
			status_command i3blocks -c ~/.i3/i3blocks.conf
		}

### Py3status
Como una alternativa a i3blocks, tenemos a py3status, cuyas instrucciones para la instalación, están [aquí](https://py3status.readthedocs.io/en/latest/intro.html#installation). Lo único que necesitamos es cambiar dentro de nuestro archivo de configuración de i3 de la siguiente forma:

    	bar {
        	status_command py3status -c ~/.i3/i3status/config
    	    font pango:InconsolataLGC Nerd Font Bold 9
	    }

**Cuidado**: en mi caso, tengo guardado el archivo de configuración para py3status dentro de la ruta especificada. Asegúrense de no sobre escribir el archivo de configuración de i3, si es que tienen guardado dicho archivo en esa carpeta. En todo caso, pueden cambiar el nombre del mismo para asegurarse de que no se sobre escriban.

### Powerline
Para la instalación de Powerline, ingresar lo siguiente en la terminal:
	
		sudo apt-get install powerline fonts-powerline
	
Una vez instalado, cambiamos la barra en nuestro archivo `~/.config/i3/config`:

		bar {
 			status_command python3.7 /usr/share/powerline/bindings/i3/powerline-i3.py  
			}

**NOTA 1:** Instalar i3ipc en caso de tener conflictos, ingresado por terminal `pip3 install i3ipc`.

**NOTA 2:** No olviden copiar los archivos de configuración, creándose una carpeta con la siguiente ruta: *~/.config/powerline/*, y copiando todo el contenido dentro en */usr/share/powerline/config_files*. Algunos archivos van a necesitar que los cambies para agregar algunos *segmentos* (por ejemplo el de Solarized).

- [Powerline: configurándolo para bash y gnu/linux (of course)](http://www.tomatesasesinos.com/2019/11/15/powerline-configurandolo-para-bash-y-gnu-linux-of-course/)
- [Powerline: añade poder a la terminal](https://www.ochobitshacenunbyte.com/2019/09/13/powerline-anade-poder-a-la-terminal/)
- [Algunos segmentos de referencia](https://powerline.readthedocs.io/en/master/configuration/segments/common.html#module-powerline.segments.common.wthr)

### Polybar
Para la instalación de polybar, asegurarse de tener incluido el siguiente backport en `/etc/apt/sources.list`:

		deb http://deb.debian.org/debian buster-backports main contrib non-free

 Ingresar por terminal lo siguiente:

		sudo apt-get install polybar


- [Polybar](https://github.com/polybar/polybar)

Algunos enlaces útiles
======================

* [Repositorio de Rofi](https://github.com/davatorium/rofi)
	* **NOTA**: Se puede instalar mediante:
		
				sudo apt-get install rofi
		
  	El principal problema es que, desde la instlación por línea de comandos,
			se tiene problemas con el layout con algunos temas.
			Para ello, pueden instarlo a mano, y luego clonan el repositorio,
			para copiar todos los temas bajados del repositorio, en su carpeta
			de temas **themes** de rofi, que está en la siguiente ruta:
			
				/usr/share/rofi/themes
							
* [Mutt - Cliente de Mail por Terminal](https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/)
* [Vimplug - Para poner plugins a VIM](https://www.ostechnix.com/vim-plug-a-minimalist-vim-plugin-manager/)
* [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
* [SimpleDesktops - Fondos de Pantalla Minimalistas](http://simpledesktops.com/)
* [Polybar](https://github.com/regolith-linux/regolith-desktop/wiki/HowTo:-Swap-out-i3bar-for-Polybar?fbclid=IwAR3QtWfotVnkvgwtbUYXKAi9mz7sSSTlZRTmkOnqf8-UwXbhp72Dj4Pe4TI)
* [Kthulu120 Themes](https://github.com/Kthulu120/i3wm-themes) (requiere i3-gaps instalado)
* [Font Awesome](https://fontawesome.com/cheatsheet)
* [Ranger - Terminal File Manager](https://wikimatze.de/ranger-a-terminal-browser-for-vim/)
* [Gtop](https://www.bleepingcomputer.com/forums/t/667825/how-to-install-gtop-on-ubuntu/)
* [Colorizer - Vim plugin](https://github.com/lilydjwg/colorizer)
* [st - Suckless Terminal](https://st.suckless.org/)
* [pfetch](https://github.com/dylanaraps/pfetch)
* [ZSH](https://linoxide.com/tools/install-zsh-on-linux/)
##	Fuentes
Se tienen algunas fuentes básicas dentro del repositorio. Para su instalación, abrir la terminal en el directorio del repositorio e ingresar lo siguiente por terminal:

		cp -r .fonts ~/

Se puede revisar el catálogo con los íconos para estas fuentes en [Font Awesome](https://fontawesome.com/cheatsheet).

##	Fuentes para Powerline
En caso de instalar **Powerline**, vamos a tener que instalar el siguiente paquete de fuentes compatibles, haciendo lo siguiente:

	
		git clone https://github.com/powerline/fonts.git --depth=1
		cd fonts/
		./install.sh
		cd ..
		rm -rf fonts/
	

y ya tendrás instaladas las fuentes. Para que aparezcan las fuentes, en el archivo de configuración de *i3* agregan lo siguiente:

	
		bar {
 			status_command python3.7 /usr/share/powerline/bindings/i3/powerline-i3.py  
  			font pango:Droid Sans Mono Slashed for Powerline 14 
			}
	
Más información: [powerline/fonts](https://github.com/powerline/fonts)

##	ST (Suckless Terminal) con dependencias incompletas
Es posible recibir los siguientes mensajes durante la instalación de st:
	
		x.c:11:10: fatal error: X11/Xatom.h: No existe el fichero o el directorio
		#include <X11/Xatom.h>
				 ^~~~~~~~~~~~~~~
		compilation terminated.
		make: *** [Makefile:22: x.o] Error 1
	
		x.c:15:10: fatal error: X11/Xft/Xft.h: No existe el fichero o el directorio
		#include <X11/Xft/Xft.h>
				 ^~~~~~~~~~~~~~~
		compilation terminated.
		make: *** [Makefile:22: x.o] Error 1

Para ambos casos, ejecutar lo siguiente en terminal:

		sudo apt-get install libx11-dev libxft-dev

##	Neofetch con imagen
Ingresar por terminal lo siguiente:

		neofetch --w3m --loop <path-image>

**NOTA**: Se debe tener instalado `w3m`.

# Screenshots
![astroids scheme](/screenshots/astroidsV2.jpg)

![darkemo scheme](/screenshots/darkemo-scheme.png)

![cute scheme](/screenshots/cute_scheme.png)

![tell me the truth scheme](/screenshots/tell-me-the-truth_scheme.png
)

![flamie scheme](/screenshots/flamie_scheme.png)
	
![cyber_anime scheme](/screenshots/cyber-anime-scheme.png)

![bigcity scheme](/screenshots/bigcity_scheme.png)	
	
![techo_red scheme](/screenshots/techno_red_scheme.png)	

![cybergirl scheme](/screenshots/cybergirl_scheme.png)

![solarized scheme](/screenshots/solarized-scheme.png)

![x-wing scheme](/screenshots/x-wing_scheme.png)

![joker scheme](/screenshots/joker-scheme.png)

![synthwave scheme](/screenshots/synthwave-scheme.png)

![rain scheme](/screenshots/rain-scheme.png)

![sky scheme](/screenshots/sky-scheme.png)

![punk-city scheme](/screenshots/punk-city-scheme.png)

![cyber-city scheme](/screenshots/cyber-city-scheme.png)

![night scheme](/screenshots/night-scheme.png)

![lofi-rain scheme](/screenshots/lofi-rain-scheme.png)

![robocity scheme](/screenshots/robocity-scheme.png)

![forest scheme](/screenshots/forest-scheme.png)

![autumn scheme](/screenshots/autumn-scheme.png)

![day-city scheme](/screenshots/day-city-scheme.png)

![raining scheme](/screenshots/raining-scheme.png)

![sleepy-hollow scheme](/screenshots/sleepy-hollow.png)

![girl-glasses scheme](/screenshots/girl-glasses-scheme.png)

![rem scheme](/screenshots/rem-scheme.png)

![books scheme](/screenshots/books-scheme.png)

![old-computer scheme](/screenshots/old-computer-scheme.png)

![keyboard scheme](/screenshots/keyboard-scheme.png)

![retro-cat scheme](/screenshots/retro-cat-scheme.png)

![flower scheme](/screenshots/flower-scheme.png)

![sunset scheme](/screenshots/sunset-scheme.png)

![umbrellas scheme](/screenshots/umbrellas-scheme.png)

![aesthetic-sea scheme](/screenshots/aesthetic-sea-scheme.png)

![lofi-fog scheme](/screenshots/lofi-fog-scheme.png)

![traffic-lights scheme](/screenshots/traffic-lights-scheme.png)

![rain-at-night scheme](/screenshots/rain-at-night-scheme.png)

![rose scheme](/screenshots/rose-scheme.png)

![office scheme](/screenshots/office-scheme.png)

![powerlines scheme](/screenshots/powerlines-scheme.png)

![john-wick scheme](/screenshots/john-wick-scheme.png)

![sad scheme](/screenshots/sad-scheme.png)

![castle scheme](/screenshots/castle-scheme.png)

![metropolis scheme](/screenshots/metropolis-scheme.png)

![futurist scheme](/screenshots/futurist-scheme.png)

![astronaut scheme](/screenshots/astronaut-scheme.png)

![john wick 2 scheme](/screenshots/john-wick2-scheme.png)

![cyber-hunter scheme](/screenshots/cyber-hunter-scheme.png)

![win7 scheme](/screenshots/win7-scheme.png)

![murder scheme](/screenshots/murder-scheme.png)

![hello-world scheme](/screenshots/hello-world-scheme.png)

![lofi-city scheme](/screenshots/lofi-city-scheme.png)

![smoke scheme](/screenshots/smoke-scheme.png)

![ruiner scheme](/screenshots/ruiner-scheme.png)
