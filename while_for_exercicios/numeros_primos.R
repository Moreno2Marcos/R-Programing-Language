numero = as.integer(readline("Digite um número: "))

cont = 0

for (num in 1:numero) {
    cat(num, " ")
    
    if (numero %% num == 0) {
        cont = cont + 1
    }
}

if (cont == 2) {
    saida = "É PRIMO!"
} else {
    saida = "NÃO É PRIMO!"
}

cat("\nO número ", numero, " foi divisível ", cont, " vezes\n",
    "E por isso ele ", saida, sep="")