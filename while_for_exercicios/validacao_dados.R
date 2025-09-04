sexo = toupper(as.character(readline("Sexo? [M/F] ")))

while ((sexo != "M") && (sexo != "F")) {
    sexo = toupper(as.character(readline("Sexo? [M/F] ")))
}

cat(sexo)