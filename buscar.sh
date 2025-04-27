#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Por favor, inserte los siguientes datos:"
	read -p "Carpeta: " carpeta
	read -p "Archivo: " archivo
else
	carpeta="$1"
	archivo="$2"
fi

busqueda=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null)

if [ -z "$busqueda" ]; then
	echo "Lo sentimos, no existe: '$archivo' en '$carpeta'"
	echo "Intente de nuevo, por favor :)"
else
	echo "¡Buenas noticias, se ha encontrado tu búsqueda en:"
	echo "$busqueda"
fi
