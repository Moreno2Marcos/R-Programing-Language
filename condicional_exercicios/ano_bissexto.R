ano = as.integer(readline("Que ano quer analisar? (Digite 0 para analisar o ano atual) "))

if (ano == 0) {
  ano = as.integer(format(Sys.Date(), "%Y"))
}

if ((ano %% 4 == 0) & (ano %% 100 != 0) | (ano %% 400 == 0)) {
  cat("O ano", ano, "é BISSEXTO!")
} else {
  cat("O ano", ano, "NÃO é BISSEXTO!")
}