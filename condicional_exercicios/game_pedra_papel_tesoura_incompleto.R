j <- 0
c <- 0

if ((j == 0) | (j == 1) | (j == 2)) {
    if (c == 0) {
        if (j == 0) {
            print("Empate")
        } else if (j == 1) {
            print("Jogador vence")
        } else if (j == 2) {
            print("Computador ganhou")
        }
    } else if (c == 1) {
        if (j == 0) {
            print("Computador ganhou")
        } else if (j == 1) {
            print("Empate")
        } else if (j == 2) {
            print("Jogador vence")
        }
    }
    
} else {
    print("Jogada inválida")
}