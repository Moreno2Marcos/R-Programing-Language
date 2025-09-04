preco <- readline("Qual é o preço do produto? R$")

preco <- as.double(preco)
desconto <- 5/100 * preco
novoPreco <- preco - desconto

saida <- paste("O produto que custava R$", preco, " na promoção, com desconto de 5% vai custar: R$",
               round(novoPreco, 2), sep="")
print(saida)