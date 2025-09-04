n1 <- readline('Ingrese um número: ')
n2 <- readline('Ingrese outro número: ')

n1 <- as.integer(n1)
n2 <- as.integer(n2)

s <- n1 + n2

output <- paste('O total de', n1, 'e', n2, 'é igual a', s)
print(output)