oposto <- readline("Comprimento do cateto oposto? ")
adjacente <- readline("Comprimento do cateto adjacente? ")

oposto <- as.double(oposto)
adjacente <- as.double(adjacente)

hipotenusa <- sqrt('^'(oposto, 2) + '^'(adjacente, 2))

saida <- paste("A hipotenusa vai medir", round(hipotenusa, 2))
print(saida)