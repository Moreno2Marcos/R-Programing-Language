x <- 10
z <- log(x, 2)
z
round(z, 2)  # arredonda a 2 casas decimais!
# retorna o numero de digitos significativos totais
# casas decimais + casas inteiras
signif(z, 2)
# arendonda um numero para o inteiro inmediatamente inferior
floor(z)
# arendonda um numero para o inteiro inmediatamente superior
ceiling(z)
# desconsidera a parte decimal do numero
trunc(z)
