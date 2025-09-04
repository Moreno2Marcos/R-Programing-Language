# Entrada de dados
kilometros <- readline('Quantos Km rodados? ')
dias <- readline('Quantos dias alugaods? ')

# Conversão do tipo variavéis
kilometros <- as.double(kilometros)
dias <- as.integer(dias)

# Calcula o preço a pagar
preco <- kilometros * 0.15 + dias * 60

# Saída de dados
output = paste('O total a pagar é de R$', preco)
print(output)