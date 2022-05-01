#!/bin/bash
#===============================================================================
#
#          FILE: Apagar.sh
# 
#         USAGE: ./Apagar.sh 
# 
#   DESCRIPTION: Apagar el monitor despues de un tiempo
#		 o en el momento.
# 
#       OPTIONS: None
#  REQUIREMENTS: Zenity
#          BUGS: ???
#         NOTES: Ninguna ^^
#        AUTHOR: Due204
#  ORGANIZATION: ---
#       CREATED: 25/03/12 20:57:01 ART
#      REVISION: 0.2
#===============================================================================


function apagar()
{
	xset dpms force off
}

APA=`yad --width=250 --height=200 --center --image-on-top --title="Apagar el Monitor" --list\
   --column=Opciones: --text "Eliga una opción"\
      "Apagar ahora"\
         "Apagar despues de un tiempo" | wc -m`

if [ $APA = 14 ]; then
	sleep 2 && apagar

elif [ $APA = 29 ];then
	TEM=`yad --entry \
		--title="Apagar el monitor" \
		--text="Introduzca el tiempo:" \
		--entry-text "tiempo en segundos"`
		if [ -z $TEM ]; then 
			exit
		else
			sleep $TEM && apagar
		fi
else
	exit
fi
