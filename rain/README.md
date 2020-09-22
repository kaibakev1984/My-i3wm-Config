##  Si quiero usar py3status
En el archivo *config* que vamos a guardar en `.config/i3/` agregamos la siguiente línea:

        bar {
        status_command py3status -c ~/.i3/i3status.conf
        position top
        separator_symbol " "
        font pango:DroidSansMono Nerd  10 
        strip_workspace_numbers yes
        # bar colors	
        colors {
	        background $bg-color
                separator  $inactive-text-color 
                #                  border             background         text
	        focused_workspace  $bg-color          $bg-color          $text-color
	        inactive_workspace $bg-color 		  $bg-color 		 $inactive-text-color
                urgent_workspace   $urgent-bg-color   $urgent-bg-color   $urgent-text-color
            }
        }

No olviden agregar el archivo *i3status.conf* en su directorio de configuraciones de *i3*, y el path en *status_command*.

##  Si quiero usar Polybar

En el archivo *config* que vamos a guardar en `.config/i3/` agregamos lo siguiente:

        exec_always --no-startup-id $HOME/.config/polybar/launch.sh

No olviden guardar el contenido dentro de la carpeta *polybar* en el directorio de configuraciones de *polybar*.