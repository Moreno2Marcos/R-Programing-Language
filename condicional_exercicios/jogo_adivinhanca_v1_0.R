jogador = as.integer(readline("Digite um número entre 0 e 5: "))
computador = sample(0:5, 1)

if (jogador == computador) {
    print("Você ganhou!")
} else {
    print('Você perdeu!')
}