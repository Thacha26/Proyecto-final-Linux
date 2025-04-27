#!/bin/bash

# Inicializar tablero vacío
board=(" " " " " " " " " " " " " " " " " ")

# Función para imprimir el tablero
print_board() {
    clear
    echo "    0   1   2"
    echo "  -------------"
    for i in {0..2}; do
        echo -n "$i |"
        for j in {0..2}; do
            idx=$((i * 3 + j))
            echo -n " ${board[$idx]} |"
        done
        echo
        echo "  -------------"
    done
}

# Función para verificar si un jugador ha ganado
check_winner() {
    local symbol=$1

    # Líneas horizontales, verticales y diagonales
    for i in 0 3 6; do
        if [[ ${board[$i]} == "$symbol" && ${board[$i+1]} == "$symbol" && ${board[$i+2]} == "$symbol" ]]; then
            return 0
        fi
    done
    for i in 0 1 2; do
        if [[ ${board[$i]} == "$symbol" && ${board[$i+3]} == "$symbol" && ${board[$i+6]} == "$symbol" ]]; then
            return 0
        fi
    done
    if [[ ${board[0]} == "$symbol" && ${board[4]} == "$symbol" && ${board[8]} == "$symbol" ]]; then
        return 0
    fi
    if [[ ${board[2]} == "$symbol" && ${board[4]} == "$symbol" && ${board[6]} == "$symbol" ]]; then
        return 0
    fi

    return 1
}

# Función para comprobar empate
check_draw() {
    for cell in "${board[@]}"; do
        if [[ "$cell" == " " ]]; then
            return 1
        fi
    done
    return 0
}

# Función principal
play_game() {
    current_player="X"
    salir=false
    
    while [[ $salir == false ]]; do
        print_board
        echo "Turno del jugador $current_player"
        echo "1. Hacer movimiento"
        echo "2. Salir del juego"
        read -p "Seleccione una opción (1-2): " opcion

        case "$opcion" in
            1)
                read -p "Ingrese fila (0-2): " row
                read -p "Ingrese columna (0-2): " col

                # Validar entrada
                if ! [[ "$row" =~ ^[0-2]$ && "$col" =~ ^[0-2]$ ]]; then
                    echo "⚠️ Movimiento inválido. Intente de nuevo."
                    sleep 1
                    continue
                fi

                idx=$((row * 3 + col))

                if [[ ${board[$idx]} != " " ]]; then
                    echo "⚠️ Espacio ocupado. Intente de nuevo."
                    sleep 1
                    continue
                fi

                board[$idx]=$current_player

                if check_winner $current_player; then
                    print_board
                    echo "🏆 ¡Jugador $current_player gana!"
                    break
                fi

                if check_draw; then
                    print_board
                    echo "🤝 ¡Empate!"
                    break
                fi

                # Cambiar de jugador
                if [[ "$current_player" == "X" ]]; then
                    current_player="O"
                else
                    current_player="X"
                fi
                ;;
            2)
                salir=true
                echo "Estás saliendo de este maravilloso juego....byee"
                ;;
            *)
                echo "Opción fuera del rango, intente otra vez"
                sleep 1
                ;;
        esac
    done
}

# Iniciar el juego
play_game
