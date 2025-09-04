soma = 0
contador = 0

for (i in 1:6) {
    string = paste("Digite o", i, "valor: ")
    valor = as.integer(readline(string))
    
    if (valor %% 2 == 0) {
        soma = soma + valor
        contador = contador + 1
    }
}

cat("Você informou", contador, 
    "números PARES e a soma foi", soma)