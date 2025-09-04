numero <- readline("Digite um número: ")

numero <- as.integer(numero)

sucessor <- numero + 1
antecessor <- numero - 1

output <- paste('Analisando o valor', numero, ', seu antecessor é', antecessor, 
                "e o seu sucessor é", sucessor)
print(output)