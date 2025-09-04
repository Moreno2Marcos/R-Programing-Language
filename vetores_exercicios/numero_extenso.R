numeros = c("zero", "um", "dois", "três", "quatro", "cinco", "seis",
            "sete", "oito", "nove", "dez", "once", "doze",
            "treze", "catorze", "quinze", "dezesseis", "dezessete",
            "dezoito", "dezenove", "vinte")

numero = as.integer(readline("Digite um número inteiro entre [0-20]? "))

while (numero < 0 | numero > 20) {
    numero = as.integer(readline("Tente novamente. Digite um número inteiro entre [0-20]? "))
}

if (numero == 0) {
    saida = numeros[1]
} else {
    saida = numeros[numero+1]
}

cat("Você digitou o número", saida)