vetor1 <- c("Fábio", "Maria", "Ana", "Jonas")

# Accesa primeiro elemento do vetor
print(vetor1[1])

# Accesa quarto elementos do vetor
print(vetor1[4])

# Accesa ao primeiro e terceiro elemento do vetor
print(vetor1[c(1, 3)])  # c(1, 3) : vetor de posições

# Accesa a todos os elementos excepto o primeiro e o último
print(vetor1[c(-1, -3)])  # Símbolo '-' significa não mostre esse elemento

# Acessa todos os elementos menos o primeiro elemento
print(vetor1[-1])

# Accesar/Mostrar apenas os 3 primeiros elementos do vetor
# Accessar a um intervalo de elementos do vetor!
print(vetor1[1:3])
