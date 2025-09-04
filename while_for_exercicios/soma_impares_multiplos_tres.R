soma = 0
cont = 0
    
for (num in 1:500) {
    if ((num %% 2 != 0) & (num %% 3 == 0)) {
        soma = soma + num
        cont = cont + 1
    }
}

cat("A soma de toso os", cont, "valores solicitados é",
    soma)