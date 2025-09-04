# Função para ler dados no console
# Retorna tipo de dados caractere
nome <- readline("Digite seu nome: ")
idade <- readline("Informe sua idade? ")

res <- paste("O aluno", nome, "tem", idade, "anos de idade.")
print(res)