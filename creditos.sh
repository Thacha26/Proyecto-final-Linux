#!/bin/bash

# ========================================
# Créditos del Proyecto con estilo
# ========================================

# Colores para resaltar texto
CYAN="\e[31m"
MAGENTA="\e[33m"
YELLOW="\e[35m"
RED="\e[36m"
RESET="\e[32m"

# Función para imprimir texto lentamente
function escribir_lento() {
    texto="$1"
    for ((i=0; i<${#texto}; i++)); do
        echo -ne "${texto:$i:1}"
        sleep 0.05
    done
    echo
}

# Limpiar pantalla
clear

# Verificar si figlet está instalado
if ! command -v figlet &> /dev/null; then
    echo -e "${YELLOW}El programa 'figlet' no está instalado.${RESET}"
    echo -e "Puedes instalarlo con: ${CYAN}sudo apt install figlet${RESET}"
    exit 1
fi

# Título principal
echo -e "${YELLOW}"
escribir_lento "╔═══════════════════════════════╗"
escribir_lento "║      CRÉDITOS DEL PROYECTO    ║"
escribir_lento "╚═══════════════════════════════╝"
echo -e "${RESET}"

# Autores
echo -e "${CYAN}"
escribir_lento "Desarrollado por:"
sleep 0.3

echo -e "${RED}"
figlet "César Hipolvedes"
sleep 0.7
echo -e "${RESET}"

echo -e "${MAGENTA}"
cat << "EOF"
    /\_____/\
   /  o   o  \
  ( ==  ^  == )
   )         (
  (           )
 ( (  )   (  ) )
(__(__)___(__)__)

EOF
echo -e "${RESET}"
sleep 0.7

echo -e "${CYAN}"
figlet "&"
echo -e "${RESET}"
sleep 0.7

echo -e "${MAGENTA}"
figlet "Frida Thais"
sleep 1

# Arte ASCII extra
echo -e "${MAGENTA}"
cat << "EOF"
⠀⠀⠀⠀⠀  ,-""""""-.
     /\j__/\  (  \`--.
     \`@_@'/  _)  >--.`.
    _{.:Y:_}_{{_,'    ) )
   {_}`-^{_} ```     (_/
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
echo -e "${RESET}"
sleep 0.5

# Información del proyecto
echo -e "${CYAN}"
escribir_lento "Curso: Linux Gen 1"
sleep 0.3
escribir_lento "Proyecto: Terminal de Trabajo"
sleep 0.3
escribir_lento "Fecha: Abril 2025"
echo -e "${RESET}"

