# Solo para instalar lo básico para la instalación
# Para que funcione, primero debemos agregar los backports para polybar
#
#  Debian Buster backports. Use with caution.
#
# deb http://deb.debian.org/debian buster-backports main contrib non-free
#

#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential valgrind manpages-dev gdb polybar feh bspwm sxhkd libx11-dev libxft-dev vim compton rofi python3-pip neofetch cmatrix htop  
sudo pip3 install --upgrade youtube-dl
cp -r .fonts ~/
cp .vimrc ~/
mkdir ~/.bspwm
mkdir ~/.sxhkd
