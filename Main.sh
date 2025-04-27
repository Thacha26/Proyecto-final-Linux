#!/bin/bash

echo -e "\t██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
echo -e "\t██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
echo -e "\t██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
echo -e "\t██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
echo -e "\t╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
echo -e "\t ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
echo -e "\t    		"


#Se bloquean lso comandos de Ctrl z y c
trap '' SIGINT  # Bloquea Ctrl+C
trap '' SIGTSTP # Bloquea Ctrl+Z

echo -e "\t ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\t Holaaa, tenga la más cordial bienvenida a esta grandiosa terminal"
echo -e "\t      Por favor, ingrese su usuario y contraseña para acceder"
echo -e "\t ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

salir=false
while [[ $salir == false ]]; do
	echo -n "Usuario: "
        read -r username
        echo -n "Contraseña: "
        read -r -s password
        echo ""

#Ahora se debe de verificar que el usuario y contraseña existan
if su -c "exit" "$username" <<< "$password" 2>/dev/null; then
        echo "Muy bien, puede acceder ahora"
        break
else
echo -e "\t ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo -e "\tLo lamento, el usuario o contraseña son incorrectos"
        echo -e "\tPor favor, elija alguna de las siguientes opciones"
        echo -e "\t1. Volver a intentar"
        echo -e "\t2. Salir"
echo -e "\t ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -r  opcion
case "$opcion" in
	1)
		continue #Si selecciona 1 continúa
		;;
	2) #Si selecciona 2 sale del prgrama
		salir=true
		echo "Nos vemosssss"
		echo "----Usted está saliendo de la terminal----"
		exit 0
                ;;
        *) #Si selecciona alguna opción fuera de las dadas marca un error
                echo "Opción fuera del rango, intenta de nuevo"
                ;;
	esac #Se termina el swich
	fi #se cierra el if
done #se cierra el done

# Inicia la terminal simulada
while true; do
	current_dir=$(pwd)
	read -r -p "$username@protecsabuddyterminal:$current_dir$ " comando args
case "$comando" in
	ayuda)
		bash ayuda.sh
                ;;
        infosis)
		bash infosis.sh
		;;
        salir)
		echo "Cerrando sesión..."
		break
		;;
	fecha)
		bash fechayhora.sh
		;;
	creditos)
		bash creditos.sh
		;;
	buscar)
                bash buscar.sh $args
                ;;
	mp3)
		bash mp3.sh
		;;
	chill)
		bash chill.sh
		;;
	juego)
		bash  juego.sh
		;;
	*)
		if command -v "$comando" >/dev/null 2>&1;then
			$comando $args
		else
			echo "Comando fuera del rango, escribe ayuda si quieres conocer las opciones disponibles"
		fi
		;;
	esac

done
