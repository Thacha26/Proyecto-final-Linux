#include <stdio.h>

char board[3][3];
char currentJugador = 'X';

void initBoard() {
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            board[i][j] = ' ';
}

void printBoard() {
    printf("  0   1   2\n");
    for (int i = 0; i < 3; i++) {
        printf("%d", i);
        for (int j = 0; j < 3; j++) {
            printf(" %c ", board[i][j]);
            if (j < 2) printf("|");
        }
        printf("\n");
        if (i < 2) printf(" ---+---+---\n");
    }
}

int checkWin() {
    for (int i = 0; i < 3; i++) {
    
        if ((board[i][0] == currentJugador && board[i][1] == currentJugador && board[i][2] == currentJugador) ||
            (board[0][i] == currentJugador && board[1][i] == currentJugador && board[2][i] == currentJugador))
            return 1;
    }

    if ((board[0][0] == currentJugador && board[1][1] == currentJugador && board[2][2] == currentJugador) ||
        (board[0][2] == currentJugador && board[1][1] == currentJugador && board[2][0] == currentJugador))
        return 1;

    return 0;
}

int checkDraw() {
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            if (board[i][j] == ' ')
                return 0;
    return 1;
}

void switchPlayer() {
    currentJugador = (currentJugador == 'X') ? 'O' : 'X';
}

int main() {
    int row, col;
    initBoard();

    while (1) {
        printBoard();
        printf("Jugador %c, ingresa tu jugada (fila y columna): ", currentJugador);
        scanf("%d %d", &row, &col);

        if (row < 0 || row > 2 || col < 0 || col > 2 || board[row][col] != ' ') {
            printf("Movimiento inválido. Intenta de nuevo.\n");
            continue;
        }

        board[row][col] = currentJugador;

        if (checkWin()) {
            printBoard();
            printf("¡Jugador %c gana!\n", currentJugador);
            break;
        }

        if (checkDraw()) {
            printBoard();
            printf("¡Empate!\n");
            break;
        }

        switchPlayer();
    }

    return 0;
}
