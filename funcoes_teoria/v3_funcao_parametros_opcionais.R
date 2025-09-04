soma = function(..., teste=TRUE) {
    if (teste) {
        vetor = c(...)
        s = 0
        
        for (valor in vetor) {
            s = s + valor
        }
        return (s)
    } else {
        return (0)
    }
}

print(soma(1, 1:4, 4))
print(soma(teste=FALSE, 1, 1:4, 4))
