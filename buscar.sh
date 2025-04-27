#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Por favor, inserte los siguientes datos: <carpeta> <archivo>"
	return 1 2>/dev/null || exit 1
fi

carpeta="$1" 
archivo="$2"

busqueda=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null)

if [ -z "$busqueda" ]; then
	echo " Lo sentimos no existe: '$archivo' en '$carpeta'"
	echo " intente de nuevo por favor :)"
else
    echo "Buenas noticias, se ha encontrado tu búsqueda en:"
    echo "$busqueda"
fi
 
