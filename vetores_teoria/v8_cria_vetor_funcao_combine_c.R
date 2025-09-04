# Função combine c(elemento1, elemento2, ...).
# Pode conter elementos heterogeneos.
vetor1 <- 1:5
vetor2 <- 12:16

vetor3 <- c(vetor1, vetor2)

# Cria um vetor de caracteres
vetor1 <- c("Fábio", "Maria", "Ana", "Jonas")
typeof(vetor1)

# Algumas funções de um vetor
is.numeric(vetor1)  # Esse vetor é numérico? True/False
is.integer(vetor1)  # Esse vetor é inteiro?
is.character(vetor1)  # É do tipo caracter?

# Função para visualizar a estrutura de um vetor
str(vetor1)

# Função para ver o cumprimento de um vetor
length(vetor1)
