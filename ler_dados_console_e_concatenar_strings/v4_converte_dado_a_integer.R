nome <- readline("Digite seu nome: ")
idade <- readline("Informe sua idade? ")
idade <- as.integer(idade)  # Converte o dado a tipo integer

res <- paste("O aluno", nome, "tem", idade, "anos de idade.")
print(res)