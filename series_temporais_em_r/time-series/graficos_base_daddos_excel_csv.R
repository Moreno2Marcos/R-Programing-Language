############################
#4. ESTATÍSTICA DESCRITIVA  
############################
# https://www.youtube.com/watch?v=CVAwcZkxGPE
# 3:00
#leitura de conjunto de dados
BD03 <- read.csv("C:/moreno-marcos/linguagem-R-doutorado/time-series/BD03.csv", sep=";")
View(BD03)

#distribuicao de frequencia univariada
cbind(frequencia = table(BD03$posto))

#outra forma (distribuicao de frequencia univariada)
# Atributo: posto
dFrequencia.posto = table(BD03$posto)
cbind(frequência = dFrequencia.posto)
# Atributo; n.reclamacoes
dFrequencia.n.reclamacoes = table(BD03$n.reclamacoes)
cbind(frequencia = dFrequencia.n.reclamacoes)

# Mostra algumas estatisticas descritivas sobre o atributo: valor.gasolina
summary(BD03$valor.gasolina)

#gráficos
plot(dFrequencia.posto)
plot(dFrequencia.n.reclamacoes)

install.packages("qcc")
library("qcc")
pareto.chart(dFrequencia.posto)
cbind(valor.gasolina = summary(BD03$valor.gasolina), 
      valor.alcool = summary(BD03$valor.alcool), 
      n.reclamacoes = summary(BD03$n.reclamacoes))

#distribuições bivariadas
freq.posto.vs.n.reclamacoes = table(posto = BD03$posto, n.reclamacoes = BD03$n.reclamacoes)
freq.posto.vs.n.reclamacoes

#plot(freq.posto.vs.n.reclamacoes, ylab = "nº de reclamações")
boxplot(BD03$n.reclamacoes ~ BD03$posto, xlab = "posto", ylab = "nº de reclamações")
boxplot(BD03$valor.gasolina ~ BD03$posto, xlab = "posto", ylab = "valor d gasolina (R$)")

# Grafico de pontos
plot(BD03$n.reclamacoes ~ BD03$valor.gasolina, 
     xlab = "valor da gasolina (R$)", 
     ylab = "nº de reclamações")
abline(lm(BD03$n.reclamacoes ~ BD03$valor.gasolina))  # lm : linear model

plot(BD03$valor.gasolina ~ BD03$valor.alcool, 
     ylab = "valor da gasolina (R$)", 
     xlab = "valor do álcool (R$)")
abline(lm(BD03$valor.gasolina ~ BD03$valor.alcool))

panel.hist <- function(x, ...) {
    usr = par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h = hist(x, plot = FALSE)
    breaks = h$breaks; nB = length(breaks)
    y = h$counts; y = y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
}
str.posto = "C"
pairs(~valor.gasolina+valor.alcool+n.reclamacoes, data = BD03, 
      labels=c("valor da gasolina (R$)", "valor do álcool(R$)", "nº de reclamações"), 
      diag.panel = panel.hist, main = paste("posto", str.posto), subset = (posto==str.posto))
