library(pwt8)  # Carregando o pacote
data("pwt8.0")  # Carregando os dados do pacote

# Variáveis escolhidas:
# PIB real (rgdpna)
# Média de horas trabalhadas (avh)
# Taxa de câmbio (xr)
br <- subset(pwt8.0, country == "Brazil", select = c(rgdpna, avh, xr))

# Criando uma variável de interesse e associando-o na base "br":
# prod: produtividade
br$prod <- br$rgdpna / br$avh

# Salva a base "br" em arquivo .txt
write.table(br, file = "dados.txt")

# Lê os dados .txt e especifica que estamos usando dados de series temporais
dados <- read.table("dados.txt")
dados <- ts(dados, start = 1950, frequency = 1)  # dados anuais (freq = 1)

# Visualizar os dados de series temporais
plot(dados)

# Personalizando o gráfico
plot(dados, col = "blue", main = "Dados Brasileiros", xlab = "Ano")
