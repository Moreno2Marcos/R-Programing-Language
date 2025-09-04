vogais = c("APRENDER", "PROGRAMAR", "LINGUAGEM", "PYTHON", "CURSO")

vogaisSplit = unlist(strsplit(vogais[1], NULL))

cat("Na plavra", vogais[1], "temos: ")

for (i in 1:length(vogaisSplit)) {
    if (vogaisSplit[i] == "A" | vogaisSplit[i] == "E" | vogaisSplit[i] == "I" |
        vogaisSplit[i] == "O" | vogaisSplit[i] == "U") {
        cat(vogaisSplit[i], " ")
    }
}