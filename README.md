##  Tabla de Contenidos

* [Introducción](#introducción)
* [Prerrequisitos](#prerrequisitos)
  * [Paquetes Generales](#paquetes-generales)
  * [Instalando bspwm](#instalando-bspwm)
  * [Instalando Polybar](#instalando-polybar)

* [Enlaces Útiles](#enlaces-útiles)
* [Fuentes](#fuentes)
* [Galería](#galería)


## Introducción

Con gusto, presento mis dotfiles, para todos aquellos que vieron mis capturas en `Linux Latinoamérica` y `XUnix`. La mayor parte del trabajo se hizo en AntiX, y estas configuraciones pretenden ser aplicables de distribuciones Debian y derivados.

## Prerrequisitos

Deben tener instalado lo siguiente:
## Paquetes Generales
	
	   sudo apt install build-essential valgrind manpages-dev gdb feh compton rofi i3lock-fancy cmatrix htop pcmanfm vim neofetch


## Instalando bspwm
Las configuraciones solo trabajan con `bspwm`, `sxhkd` y `polybar`

		sudo apt-get install bspwm sxhkd

**NOTA**: Para los que usen Debian 10 o derivados, deben tener en cuenta que la instalación les va a traer la versión `0.9.5`, el cuál viene con un bug que se resolvió en versiones posteriores. Por eso, antes de realizar la instalación de `bspwm`, asegúrense de tener habilitado el siguiente repositorio en su archivo `/etc/apt/sources.list`

		 deb http://ftp.de.debian.org/debian sid main 

Para hacer la instalación sin tener que agregar Sid, solamente ingresar en terminal `sudo apt-get update && sudo apt-get install bspwm`, y después borrar del repositorio la línea que agregaron en `sources.list`


## Instalando Polybar
Para la instalación de polybar, asegurarse de tener incluido el siguiente backport en `/etc/apt/sources.list`:

		deb http://deb.debian.org/debian buster-backports main contrib non-free

 Ingresar por terminal lo siguiente:

		sudo apt-get install polybar


- [Polybar](https://github.com/polybar/polybar)

## Enlaces útiles

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

## Galería

Para acceder a un tema, hacer click sobre la imagen del tema deseado

[![night scheme](https://i.postimg.cc/Y0fHZdt1/night-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/night)

[![lofi-rain scheme](https://i.postimg.cc/8khN7zLj/lofi-rain-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-rain)

[![robocity scheme](https://i.postimg.cc/YCyw5GBy/robocity-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/robocity)

[![forest scheme](https://i.postimg.cc/90V3dyyz/forest-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/forest)

[![autumn scheme](https://i.postimg.cc/6pFmVdXw/autumn-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/autumn)

[![day-city scheme](https://i.postimg.cc/DZPpKHby/day-city-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/day-city)

[![raining scheme](https://i.postimg.cc/qM5b08gn/raining-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/raining)

[![sleepy-hollow scheme](https://i.postimg.cc/rmMggjY6/sleepy-hollow.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sleepy-hollow)

[![girl-glasses scheme](https://i.postimg.cc/ydLhjHZ9/girl-glasses-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/girl-glasses)

[![rem scheme](https://i.postimg.cc/vDF4Lq3f/rem-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rem)

[![books scheme](https://i.postimg.cc/MHkBdpGn/books-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/books)

[![old-computer scheme](https://i.postimg.cc/Mprv9pPz/old-computer-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/old-computer)

[![keyboard scheme](https://i.postimg.cc/MKp6g8jH/keyboard-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/keyboard)

[![retro-cat scheme](https://i.postimg.cc/K85dbKSy/retro-cat-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/retro-cat)

[![flower scheme](https://i.postimg.cc/k4NSYdRw/flower-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/flower-scheme)

[![sunset scheme](https://i.postimg.cc/j2prDBZ0/sunset-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sunset)

[![umbrellas scheme](/screenshots/umbrellas-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/umbrellas)

[![aesthetic-sea scheme](/screenshots/aesthetic-sea-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/aesthetic-sea)

[![lofi-fog scheme](/screenshots/lofi-fog-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-fog)

[![traffic-lights scheme](/screenshots/traffic-lights-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/traffic-lights)

[![rain-at-night scheme](/screenshots/rain-at-night-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rain-at-night)

[![rose scheme](/screenshots/rose-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rose)

[![office scheme](/screenshots/office-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/office)

[![powerlines scheme](/screenshots/powerlines-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/powerlines)

[![john-wick scheme](/screenshots/john-wick-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/john-wick)

[![sad scheme](/screenshots/sad-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sad)

[![castle scheme](/screenshots/castle-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/castle)

[![metropolis scheme](/screenshots/metropolis-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/metropolis)

[![futurist scheme](/screenshots/futurist-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/futurist)

[![astronaut scheme](/screenshots/astronaut-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/astronaut)

[![john wick 2 scheme](/screenshots/john-wick2-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/john-wick2)

[![cyber-hunter scheme](/screenshots/cyber-hunter-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cyber-hunter)

[![win7 scheme](/screenshots/win7-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/win7)

[![murder scheme](/screenshots/murder-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/murder)

[![hello-world scheme](/screenshots/hello-world-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/hello-world)

[![lofi-city scheme](/screenshots/lofi-city-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-city)

[![smoke scheme](/screenshots/smoke-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/smoke)

[![ruiner scheme](/screenshots/ruiner-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/ruiner)

[![chicago95 scheme](/screenshots/chicago95-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/chicago95)

[![focus scheme](/screenshots/focus-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/focus)

[![break scheme](/screenshots/break-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/break)

[![triangles scheme](/screenshots/triangles-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/triangles)

[![404-error scheme](/screenshots/404-error-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/404-error)

[![soft scheme](/screenshots/soft-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/soft)
