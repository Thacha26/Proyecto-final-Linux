#!/bin/bash

#Primero se debe de verificar que  se tiene el programa mpg123 descargado
#Si no es así, se debe de instalar para poder continuar
if ! command -v mpg123 &> /dev/null; then
	echo "Usted no tiene instalado el programa ""mpg123""."
	echo " Por favor, seleccione (s/n) para continuar con la instalación"
	read respuestaUser
	if [[ "$respuestaUser" == "s" || "$respuestaUser" == "S" ]]; then
		sudo apt update && sudo apt install mpg123 -y
	else
		echo "Lo siento, no se puede usar el mp3 sin el programa, usted debe de seleccionar (s)"
	exit 1
    fi
fi

# Ahora se debe de crear la carpeta de música
echo "Por favor, ingreae la ruta de la carpeta a la que quiere mandar la música:"
echo "Por ejemplo /home/frida-thais/Descargas"
read carpeta_musica
while IFS= read -r -d $'\0' file; do
    canciones+=("$file")
done < <(find "$carpeta_musica" -type f -iname "*.mp3" -print0)

total=${#canciones[@]}

if [[ $total -eq 0 ]]; then
	echo "No se han encontrado canciones en la carpeta: $carpeta_musica"
	echo "Por favor, verifique que la carpeta sea la correcta."
	ls -lh "$carpeta_musica"
	exit 1
fi

clear

echo -e "\t██████╗      ██╗       ███╗   ███╗██████╗ ██████╗ " 
echo -e "\t██╔══██╗     ██║       ████╗ ████║██╔══██╗╚════██╗"
echo -e "\t██║  ██║     ██║       ██╔████╔██║██████╔╝ █████╔╝"
echo -e "\t██║  ██║██   ██║       ██║╚██╔╝██║██╔═══╝  ╚═══██╗"
echo -e "\t██████╔╝╚█████╔╝    ██╗██║ ╚═╝ ██║██║     ██████╔╝"
echo -e "\t╚═════╝  ╚════╝     ╚═╝╚═╝     ╚═╝╚═╝     ╚═════╝ "
echo -e "\t                                                  "

echo -e "\t━━━━━━━━━━ REPRODUCTOR DE MÚSICA MP3 ━━━━━━━━━━"
echo -e "\t Comandos disponibles "
echo -e "\t p - Pausa/Play"
echo -e "\t n - Siguiente"
echo -e "\t s - Salir"
echo -e "\t l - Listar"
echo -e "\t a - atrás"
echo -e "\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

#Se crea un bucle para que la reproducción sea infinita hasta que se use el comando de pause
i=0
pausaBoton=0

while ((i < $total)); do
	actual="${canciones[$i]}"
	cancion=$(basename "$actual")
	echo "Canción actual: $cancion"

#Se crea un bucle para mantener la reproducción en segundo plano
#Se guarda el PID (process ID), para poderlo controlar

mpg123 "$actual" >/dev/null 2>&1 &
pid=$!

	while kill -0 $pid 2>/dev/null; do

		read -t 1 -n 1 tecla
		case  "$tecla" in #inicia el case swich
			p)
				if ((pausaBoton == 0)); then
                   		kill -STOP $pid
                    		echo "  [PAUSA]"
                    		pausaBoton=1
                	else
                    		kill -CONT $pid

                    		echo "   [REANUDANDING LA SONG]"
                    		pausaBoton=0
                	fi
                		;;
			n)
				kill -9 $pid
				echo "Siguiente canción"
				break
				;;
			a)
				kill -9 $pid
				i=$((i-2)) #Se retrocede 2 porque luego tenemoos un i++ que suma 1
				echo "[Canciónsilla anterior]"
				break
				;;
			s)
				kill -9 $pid
				echo "Saliendo del mp3 "
				echo "..... BYEEEEEEEE ..... "
				exit 0
				;;
			l)
				echo "Lista de canciones:"
                		for ((j=0; j<total; j++)); do
                    			if [ $j -eq $i ]; then
                        			echo "-> $(basename "${canciones[$j]}") (ACTUAL)"
                    			else
                        			echo "   $(basename "${canciones[$j]}")"
                    			fi
                		done
                		;;
        		esac
    		done

    		((i++))

	if ((i >= total)); then
		i=0
			echo "--------Este es el final de la lista de reproducción--------"
	echo "--------Se reiniciará la playlist, si no quiere esto, por favor salga de la playlist--------"

	fi
	done
