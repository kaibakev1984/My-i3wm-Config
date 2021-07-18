<div align="center">
<img src="https://i.postimg.cc/XNk5Rfnp/logo-bspwm.png" alt="Logo Lorblak bspwm">
</div>
</br>

***

</br>
<div align="center">
<a href='https://postimg.cc/pyXg7xGH' target='_blank'><img src='https://i.postimg.cc/pyXg7xGH/lofi-rain-scheme.png' border='0' alt='lofi-rain-scheme'/></a> <a href='https://postimg.cc/sMS8S2Xp' target='_blank'><img src='https://i.postimg.cc/sMS8S2Xp/robocity-scheme.png' border='0' alt='robocity-scheme'/></a> <a href='https://postimg.cc/ygSS62nY' target='_blank'><img src='https://i.postimg.cc/ygSS62nY/girl-glasses-scheme.png' border='0' alt='girl-glasses-scheme'/></a> <a href='https://postimg.cc/RWKSF4xY' target='_blank'><img src='https://i.postimg.cc/RWKSF4xY/old-computer-scheme.png' border='0' alt='old-computer-scheme'/></a> </br><a href='https://postimg.cc/qtZ6cpgG' target='_blank'><img src='https://i.postimg.cc/qtZ6cpgG/john-wick-scheme.png' border='0' alt='john-wick-scheme'/></a> <a href='https://postimg.cc/PpJs1SYF' target='_blank'><img src='https://i.postimg.cc/PpJs1SYF/fantasy-scheme.png' border='0' alt='fantasy-scheme'/></a> <a href='https://postimg.cc/G43fpXF9' target='_blank'><img src='https://i.postimg.cc/G43fpXF9/tower-scheme.png' border='0' alt='tower-scheme'/></a> <a href='https://postimg.cc/D8Wj1zZx' target='_blank'><img src='https://i.postimg.cc/D8Wj1zZx/umbrellas-scheme.png' border='0' alt='umbrellas-scheme'/></a> </br>
<a href='https://postimg.cc/2qWSm9RV' target='_blank'><img src='https://i.postimg.cc/2qWSm9RV/sentre-scheme.png' border='0' alt='sentre-scheme'/></a> <a href='https://postimg.cc/cgh4WS8n' target='_blank'><img src='https://i.postimg.cc/cgh4WS8n/break-scheme.png' border='0' alt='break-scheme'/></a> <a href='https://postimg.cc/DJxqZfNZ' target='_blank'><img src='https://i.postimg.cc/DJxqZfNZ/anime-minimal-scheme.png' border='0' alt='anime-minimal-scheme'/></a> <a href='https://postimg.cc/9rpMtcnq' target='_blank'><img src='https://i.postimg.cc/9rpMtcnq/metropolis-scheme.png' border='0' alt='metropolis-scheme'/></a>
</div> </br>

##  Tabla de Contenidos

* [Instalación](#instalación)
  * [Instalando bspwm](#instalando-bspwm)
  * [Instalando Polybar](#instalando-polybar)
  * [Instalado un tema](#instalando-un-tema)
  * [Paquetes Opcionales](#paquetes-opcionales)
* [Enlaces Útiles](#enlaces-útiles)
* [Galería](#galería)

## Instalación

Por el momento, la instalación de **bspwm** y **polybar** descripta a continuación, solo fue pensado para Debian y derivados. Próximamente se incluirá un instructivo para instalar en Arch Linux.



## Instalando bspwm
Las configuraciones solo trabajan con `bspwm`, `sxhkd` y `polybar`
~~~bash
		sudo apt-get install bspwm sxhkd
~~~
**NOTA**: Para los que usen Debian 10 o derivados, deben tener en cuenta que la instalación les va a traer la versión `0.9.5`, el cuál viene con un bug que se resolvió en versiones posteriores. Por eso, antes de realizar la instalación de `bspwm`, asegúrense de tener habilitado el siguiente repositorio en su archivo `/etc/apt/sources.list`

		 deb http://ftp.de.debian.org/debian sid main 

Para hacer la instalación sin tener que agregar Sid, solamente ingresar en terminal `sudo apt-get update && sudo apt-get install bspwm`, y después borrar del repositorio la línea que agregaron en `sources.list`


## Instalando Polybar
Para la instalación de polybar, asegurarse de tener incluido el siguiente backport en `/etc/apt/sources.list`:

		deb http://deb.debian.org/debian buster-backports main contrib non-free

 Ingresar por terminal lo siguiente:
~~~bash
		sudo apt-get install polybar
~~~

## Instalando un tema

De momento, la instalación es manual. Para realizar la instalación, debemos asegurarnos de tener instalado *bspwm*, *polybar*, *Rofi*, *Compton*. También necesitaremos tener descargado *st* (incluída sus dependencias). Vamos a realizar la instalación del tema *break*.

1. Abrimos la terminal y clonamos el repositorio con el siguiente comando:
~~~bash
  git clone https://github.com/kaibakev1984/Lorblak-Dotfiles
~~~

![git clone](https://i.postimg.cc/kMTLn6KV/capture1.png)

2. Una vez descargado, nos dirigimos al repositorio y accedemos al directorio *break*. Tendremos lo siguiente:

![break directory](https://i.postimg.cc/GmCnSBDH/capture2.png)

Estos los son archivos que necesitaremos para configurar nuestro *Riced*.

3. El archivo *bspwmrc* es el archivo que necesitaremos para configurar *bspwm*. Para instalarlo hacemos lo siguiente:
~~~bash
  mkdir ~/.config/bspwm
  cp bspwmrc ~/.config/bspwm
~~~

4. El archivo `sxhkdrc` nos permite configurar los atajos de nuestro teclado. Para instalarlo hacemos lo siguiente:

~~~bash
  mkdir ~/.config/sxhkd
  cp sxhkdrc ~/.config/sxhkd
~~~

5. Instalamos el tema `Break` para *Rofi* ingresando lo siguiente por terminal:
~~~bash
  sudo cp break.rasi /usr/share/rofi/themes
~~~

6. Tenemos el directorio *polybar*, en el cual se encuentran los archivos de configuración para dicha barra. Para instalarlo hacemos lo siguiente:
~~~bash
  cp -r polybar ~/.config
~~~

7. Para instalar las fuentes, tenemos el directorio `.fonts`. En mi caso, lo vamos a instalar en nuestro $HOME haciendo:
~~~bash
  cp -r .fonts ~/
~~~

8. Una vez terminado de copiar los archivos, reiniciamos *bspwm* haciendo <kbd>Super</kbd>+<kbd>Alt</kbd>+<kbd>r</kbd>

9. Para configurar `st`, primero descargamos el archivo comprimido `st.0.8.4` de este [enlace](https://st.suckless.org/). 

<p align="center">
<a href='https://i.postimg.cc/XNB20DpQ/st-main-page.png' target='_blank'><img align="center" width="300" height="200" src='https://i.postimg.cc/XNB20DpQ/st-main-page.png' border='0' alt='st-main-page'/></a>
</p>

10. Nos ubicamos en donde tenemos instalado *st* y descomprimimos haciendo:

~~~bash
  tar -xvf st.0.8.4.tar.gz
~~~
Nos debería quedar algo así:

![st ](https://i.postimg.cc/1R8LM089/capture4.png)

11. En nuestro directorio con el tema *break* hay un archivo llamado `st-break.diff`, que contiene nuestro tema para *st*. Para instalarlo, copiamos dicho documento en el directorio donde descomprimimos *st*. Nos debería quedar algo así:

![st ls](https://i.postimg.cc/Pf007LD1/capture5.png)

12. Para instalar nuestro tema, nos ubicaremos al directorio *st.0.8.4* e ingresamos lo siguiente:
~~~bash
  sudo make uninstall
  patch -i st-break.diff
  sudo make clean install
~~~

13. Para el fondo de pantalla, copiamos la imagen *break.jpg* en la ruta de nuestro gusto. En mi caso lo instalo en `~/Imágenes`. Para agregarle el fondo ingresamos por terminal:

~~~bash
  feh --bg-fill ~/Imágenes/break.jpg
~~~

14. Nuestro tema se debería ver así:

<p align="center">
<a href='https://i.postimg.cc/GtPPzSY7/capture6.png' target='_blank'><img align="center" width="300" height="150" src='https://i.postimg.cc/GtPPzSY7/capture6.png' border='0' alt='break-main-screen'/></a> </br>
<a href='https://i.postimg.cc/6q16sBdy/capture7.png' target='_blank'><img align="center" width="300" height="150" src='https://i.postimg.cc/6q16sBdy/capture7.png' border='0' alt='break-rofi'/></a>
</p>


## Paquetes Opcionales
~~~bash	
	   sudo apt install build-essential valgrind manpages-dev gdb feh compton rofi i3lock-fancy cmatrix htop pcmanfm vim neofetch
~~~

## Enlaces útiles
* [Polybar](https://github.com/polybar/polybar)
* [Rofi](https://github.com/davatorium/rofi)
* [Font Awesome Cheatsheet](https://fontawesome.com/cheatsheet)
* [Nerd Font Cheatsheet](https://www.nerdfonts.com/cheat-sheet)
* [Mutt - Cliente de Mail por Terminal](https://www.thegeekdiary.com/how-to-install-and-configure-mutt-in-centos-rhel/)
* [Vimplug - Para poner plugins a VIM](https://www.ostechnix.com/vim-plug-a-minimalist-vim-plugin-manager/)
* [Polybar](https://github.com/regolith-linux/regolith-desktop/wiki/HowTo:-Swap-out-i3bar-for-Polybar?fbclid=IwAR3QtWfotVnkvgwtbUYXKAi9mz7sSSTlZRTmkOnqf8-UwXbhp72Dj4Pe4TI)
* [Ranger](https://wikimatze.de/ranger-a-terminal-browser-for-vim/)
* [Gtop](https://www.bleepingcomputer.com/forums/t/667825/how-to-install-gtop-on-ubuntu/)
* [pfetch](https://github.com/dylanaraps/pfetch)
* [Colorizer - Vim plugin](https://github.com/lilydjwg/colorizer)
* [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
* [st - Suckless Terminal](https://st.suckless.org/)
* [zsh](https://linoxide.com/tools/install-zsh-on-linux/)
* [SimpleDesktops - Fondos de Pantalla Minimalistas](http://simpledesktops.com/)

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

[![lofi-rain scheme](https://i.imgur.com/wajd2qK.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-rain)
[![day-city scheme](https://i.imgur.com/1GGVW4A.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/day-city)
[![old-computer scheme](https://i.imgur.com/IO5tApV.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/old-computer)
[![cat scheme](https://i.imgur.com/OfZN1NV.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cat)
[![lofi-fog scheme](https://i.imgur.com/faR8o5U.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-fog)
[![powerlines scheme](https://i.imgur.com/dqYQCLq.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/powerlines)
[![cyber-hunter scheme](https://i.imgur.com/6Woy3O7.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cyber-hunter)
[![fantasy scheme](https://i.imgur.com/7gpItzO.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/fantasy)
[![futurist scheme](https://i.imgur.com/GMDnITh.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/futurist)
[![robocity scheme](https://i.imgur.com/bgDZ3qc.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/robocity)
[![reflection scheme](https://i.imgur.com/Xf83ygO.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/reflection)
[![climbing scheme](https://i.postimg.cc/MKnQYznW/climbing-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/climbing)
[![sad scheme](https://i.imgur.com/Zk6YdLY.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sad)
[![lofi-city scheme](https://i.postimg.cc/FzLy4nRn/lofi-city-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/lofi-city)
[![forest scheme](https://i.postimg.cc/90V3dyyz/forest-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/forest)
[![autumn scheme](https://i.imgur.com/sAUm0hg.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/autumn)
[![girl-glasses scheme](https://i.postimg.cc/x1wCF1YR/girl-glasses-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/girl-glasses)
[![rem scheme](https://i.imgur.com/IdBNfcl.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rem)
[![books scheme](https://i.imgur.com/gTiD7lZ.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/books)
[![keyboard scheme](https://i.imgur.com/0DJ1PyV.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/keyboard)
[![sunset scheme](https://i.postimg.cc/qq71YWDt/sunset-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sunset)
[![umbrellas scheme](https://i.postimg.cc/L8SY3HWr/umbrellas-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/umbrellas)
[![aesthetic-sea scheme](https://i.postimg.cc/j20Tzjj9/aesthetic-sea-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/aesthetic-sea)
[![rainatnight scheme](https://i.imgur.com/M9QcUDn.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rainatnight)
[![john-wick scheme](https://i.postimg.cc/LXmkpXpG/john-wick-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/john-wick)
[![castle scheme](https://i.imgur.com/XescVpu.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/castle)
[![metropolis scheme](https://i.imgur.com/OOszgK4.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/metropolis)
[![astronaut scheme](https://i.postimg.cc/wMy1887S/astronaut-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/astronaut)
[![john wick 2 scheme](https://i.postimg.cc/kMzVN4H9/john-wick2-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/john-wick2)
[![murder scheme](https://i.imgur.com/X4lMiEW.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/murder)
[![hello-world scheme](https://i.imgur.com/ciF2JZo.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/hello-world)
[![smoke scheme](https://i.imgur.com/eXSn5l6.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/smoke)
[![futurist-city scheme](https://i.postimg.cc/5twMfsbz/futurist-city-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/futurist-city)
[![ruiner scheme](https://i.postimg.cc/jj3PJrnF/ruiner-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/ruiner)
[![focus scheme](https://i.postimg.cc/7LRJZMpv/focus-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/focus)
[![break scheme](https://i.postimg.cc/vTF1W8Y3/break-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/break)
[![404-error scheme](https://i.postimg.cc/qMGt3d9x/404-error-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/404-error)
[![soft scheme](https://i.postimg.cc/T37ptJ2y/soft-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/soft)
[![alley scheme](https://i.postimg.cc/C5v5H2Vf/alley-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/alley)
[![diary scheme](https://i.imgur.com/Ko8w2dr.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/diary)
[![qa scheme](https://i.postimg.cc/k4yrh4Qf/qa-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/qa)
[![samurai scheme](https://i.imgur.com/UGdpQqi.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/samurai)
[![cobra kai scheme](https://i.imgur.com/JzmNgtP.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cobra-kai)
[![gruvgirl scheme](https://i.imgur.com/q2OIuIC.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/gruvgirl)
[![year scheme](https://i.imgur.com/BzAASrO.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/year)
[![sentre scheme](https://i.postimg.cc/bvCDx4mH/sentre-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/sentre)
[![tower scheme](https://i.imgur.com/Qnvzzud.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/tower)
[![anime-cat scheme](https://i.postimg.cc/zDtXPLDp/anime-cat-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/anime-cat)
[![anime minimal scheme](https://i.postimg.cc/j2bvMLQz/anime-minimal-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/anime-minimal)
[![cyber-city scheme](https://i.postimg.cc/TPxJkB74/cyber-city-bspwm-scheme.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cyber-city)
[![cyber-city scheme](https://i.imgur.com/sTyehEw.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/code)
[![arch scheme](https://i.imgur.com/pCkn3Iv.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/arch)
[![ghostintheshell scheme](https://i.imgur.com/qdGLemf.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/ghostintheshell)
[![rikka scheme](https://i.imgur.com/d0dT4PG.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/rikka)
[![earth scheme](https://i.imgur.com/qaPxiSu.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/earth)
[![cyberpunk-astronaut scheme](https://i.imgur.com/ucWoqpp.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/cyberpunk-astronaut)
[![powershell scheme](https://i.imgur.com/aDpddT1.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/powershell)
[![horizont scheme](https://i.imgur.com/K65Fiyh.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/horizont)
[![office scheme](https://i.imgur.com/GX6NFYR.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/office)
[![snorlax scheme](https://i.imgur.com/yTY5qbv.png)](https://github.com/kaibakev1984/Lorblak-Dotfiles/tree/master/snorlax)
