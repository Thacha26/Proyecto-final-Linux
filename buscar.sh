#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Por favor, inserte los siguientes datos: <carpeta> <archivo>"
	exit 1
fi

carpeta="$1" 
archivo="$2"

busqueda=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null)

if [ -z "$busqueda" ]; then
	echo " Lo sentimos no existe: '$archivo' en '$carpeta'\n intente de nuevo por favor :)"
	exit 1
else
    echo "Buenas noticias, se ha encontrado tu búsqueda en:"
    echo "$busqueda"
fi
 
