#https://www.youtube.com/watch?v=CVAwcZkxGPE

# Séries temporais
# Criando subgrupos de dados.
# Seprando o cojuntos de dados em 3 grupos.
gasolina.A = BD03$valor.gasolina[BD03$posto=="A"]
gasolina.B = BD03$valor.gasolina[BD03$posto=="B"]
gasolina.C = BD03$valor.gasolina[BD03$posto=="C"]

# Resumo de metricas estatisticas dos subgrupos de dados
# criados.
cbind(valor.gasolina.A = summary(gasolina.A), 
      valor.gasolina.B = summary(gasolina.B), 
      valor.gasolina.C = summary(gasolina.C))

#agrupando por unidade de tempo
diasSemana = weekdays(as.Date(BD03$data))
View(cbind(dia = diasSemana, data=as.character(BD03$data)))
boxplot(BD03$valor.gasolina~diasSemana)

#codificando para os dias da semana
diasSemana[diasSemana=="domingo"]=1
diasSemana[diasSemana=="segunda-feira"]=2
diasSemana[diasSemana=="terça-feira"]=3
diasSemana[diasSemana=="quarta-feira"]=4
diasSemana[diasSemana=="quinta-feira"]=5
diasSemana[diasSemana=="sexta-feira"]=6
diasSemana[diasSemana=="sábado"]=7

boxplot(BD03$valor.gasolina~diasSemana, xlab="dia da semana", ylab = "valor da gasolina (R$)")
boxplot(BD03$valor.alcool~diasSemana, xlab="dia da semana", ylab = "valor do álcool (R$)")
boxplot(BD03$n.reclamacoes~diasSemana, xlab="dia da semana", ylab = "nº de reclamações")

mesesDoAno = months(as.Date(BD03$data))
names(table(mesesDoAno))

# Codificação para o meses do ano
mesesDoAno[mesesDoAno=="fevereiro"]=2
mesesDoAno[mesesDoAno=="março"]=3
mesesDoAno[mesesDoAno=="abril"]=4
mesesDoAno[mesesDoAno=="maio"]=5
boxplot(BD03$valor.gasolina~mesesDoAno, xlab = "mês do ano", ylab = "valor da gasolina (R$)")
boxplot(BD03$valor.alcool~mesesDoAno, xlab = "mês do ano", ylab = "valor do álcool (R$)")
boxplot(BD03$n.reclamacoes~mesesDoAno, xlab = "mês do ano", ylab = "nº de reclamações")

# ESTUDO DIARIO --- AQUI SERIES TEMPORAIS (43:00)
ts.plot(cbind(gasolina.A, gasolina.B, gasolina.C),
        gpars=list(xlab="", ylab="valor da gasolina (R$)", 
                   col=rainbow(3), lty=c(1:3), 
                   xaxt="n", lwd = 2))
legend("bottomleft", legend = names(table(BD03$posto)), 
       col = rainbow(3), lty=c(1:3), lwd = 2, bty = "n")
datas = names(table(BD03$data))
nDatas= length(datas); at_ = seq(1, nDatas, by = 7)
axis(side = 1,at = at_,  labels = datas[at_], las = 2)

# 55:00