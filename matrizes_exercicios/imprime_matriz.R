vetor = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
matriz = matrix(vetor, 3, 3)
print(matriz)

for (fila in 1:3) {
    for (coluna in 1:3) {
        matriz[fila, coluna] = as.double(readline(cat("Digite um valor para [", fila, ",", coluna, "]")))
    }
}

print(matriz)