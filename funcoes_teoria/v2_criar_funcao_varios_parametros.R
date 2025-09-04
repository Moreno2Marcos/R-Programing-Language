soma = function(...) {
    vetor = c(...)
    s = 0
    
    for (valor in vetor) {
        s = s + valor
    }
    
    return (s)
}

print(soma(5, 6))
print(soma(7, 8, 9))
print(soma(1, 1:4, 4))
