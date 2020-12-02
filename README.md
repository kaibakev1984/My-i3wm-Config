# Lorblak-Dotfiles

Con gusto, presento mis dotfiles, para todos aquellos que vieron mis capturas en `Linux Latinoamérica` y `XUnix`. La mayor parte del trabajo se hizo en AntiX, y estas configuraciones pretenden ser aplicables de distribuciones Debian y derivados.

Prerrequisitos
==============
Deben tener instalado lo siguiente:
## Paquetes generales
	
	   sudo apt install build-essential valgrind manpages-dev gdb feh compton rofi i3lock-fancy cmatrix htop pcmanfm vim neofetch


## Instalando bspwm
Las configuraciones solo trabajan con `bspwm`, `sxhkd` y `polybar`

		sudo apt-get install bspwm sxhkd

**NOTA**: Para los que usen Debian 10 o derivados, deben tener en cuenta que la instalación les va a traer la versión `0.9.5`, el cuál viene con un bug que se resolvió en versiones posteriores. Por eso, antes de realizar la instalación de `bspwm`, asegúrense de tener habilitado el siguiente repositorio en su archivo `/etc/apt/sources.list`

		 deb http://ftp.de.debian.org/debian sid main 

Para hacer la instalación sin tener que agregar Sid, solamente ingresar en terminal `sudo apt-get update && sudo apt-get install bspwm`, y después borrar del repositorio la línea que agregaron en `sources.list`


### Instalando Polybar
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

![chicago95 scheme](/screenshots/chicago95-scheme.png)

![focus scheme](/screenshots/focus-scheme.png)

![break scheme](/screenshots/break-scheme.png)
