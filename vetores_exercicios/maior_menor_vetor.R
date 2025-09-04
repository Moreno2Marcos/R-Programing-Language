aleatorios = c(sample(0:50, 1), sample(0:50, 1), sample(0:50, 1),
               sample(0:50, 1), sample(0:50, 1))

cat("Os valores sorteados foram:", aleatorios, "\n")

for (i in 1:length(aleatorios)) {
    if (i == 1) {
        menor = maior = aleatorios[i]
    } else {
        if (aleatorios[i] > maior) {
            maior = aleatorios[i]
        } else if (aleatorios[i] < menor) {
            menor = aleatorios[i]
        }
    }
}

cat("O maior valor sorteado foi:", maior, "\n")
cat("O menor valor sorteado foi:", menor)