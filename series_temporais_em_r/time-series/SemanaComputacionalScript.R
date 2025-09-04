#1. OPERAÇÕES BÁSICAS
101+102#retorna a soma de valores
1:3#gera sequências inteiras
(2:30)^2#realiza operações sobre sequências
x = 2:6; y = 4:8
y[2]#retorna o valor indexado
z = c(x,y)#função que concatena valores
z[z<5]#retorna valores que satisfazem a condição
which(z==5)#retorna os índices que satisfazem a condição
x*y#mulipliplica valores de mesmo índice
x = matrix(data = 2:5, ncol = 2, byrow = TRUE, 
           dimnames = list(c("r1", "r2"), c("c1", "c2")))
View(x)
x[1,]#retorna os valores da linha fixada
x[,2]#retorna os valores da coluna fixada
x[1,2]#retorna o valor do par de índices fixado
y = t(x); View(y)#retorna a transposta
z = x*y; View(z)#retorna o produto por par de índices
w = x%*%y# retorna o produto das matrizes 
i = solve(x) #retorna a matriz inversa
x%*%i
det(x)#retorna o determinante

#2. FUNÇÕES
f1 = function(x){
  return(sin(x^2))
}
#esboço:
curve(f1, from = -3, to=3, 
      xlab = "x", ylab=expression("f(x)" == seno(x^2)))
x=c(-1,-1, 1, 1); 
y=c(0,  1, 1, 0)
polygon(x, y, col="red")
#texto
text(x = 0, y = 0.5, "red box", col = "white")
#hachurando área:
x <- seq(-2, 2, length.out = 100) 
f1x = f1(x)
polygon(rbind(cbind(rev(x), 0), cbind(x, f1x)), col = "gray")
#integral definida:
integrate_ = integrate(f1, lower = -2, upper = 2)
#texto com expressão
text(x = -.1, y = -.3, bquote(integral(seno(x^2)*dx, lower = -2, upper = 2)==.(integrate_$value)))

#distribuicao normal
m=1.65; s=.2
f = function(x) {
  (1/(sqrt(2*pi)*s))*exp(-(1/2)*((x-m)/s)^2)
}
ll = m - 5*s; ul = m + 5*s
curve(f(x), from = ll, to=ul, ylab = "")
abline(a=0, b=0)
x <- seq(1.8, 3, length.out = 100) ; fx = f(x)
polygon(rbind(cbind(rev(x), 0), cbind(x, fx)), col = "gray")
text(x = .6, y = 1.9, adj = 0, bquote(paste("f(x|", mu==.(m), ",", sigma==.(s), ")=")))
text(x = 1, y = 1.5, bquote(frac(1, sqrt(2*pi)*sigma)*e^(-0.5%*%(frac(x-mu,sigma))^2)))
integrate_ = integrate(f, lower = min(x), upper = max(x))
text(x = 2, y = 1, adj = 0, bquote(integral(f(x)*dx, lower = 1.8, upper = +infinity)%~~%.(round(integrate_$value, 2))))

#3. MATEMÁTICA SIMBÓLICA
f = quote(sin(x^2 + log(y + z))) 
#Derivadas
df.dx = D(f, "x")
df.dy = D(f, "y")
eval(f, list(x=1, y=1, z=2))
eval(df.dx, list(x=1, y=1, z=2))

f2 = quote(x^2*y + log(y)/z + y*exp(z)) 
#Matriz Hessiana
H = deriv(expr = f2, namevec = c("x", "y", "z"), hessian = TRUE)

#4. ESTATÍSTICA DESCRITIVA
#leitura de conjunto de dados
BD03 <- read.csv("G:/Meu Drive/UFCA/Ensino/CRAN R_aulas/data/BD03.csv", sep=";")
View(BD03)
#distribuicao de frequencia univariada
cbind(frequencia = table(BD03$posto))
#outra forma
dFrequencia.posto = table(BD03$posto)
cbind(frequência = dFrequencia.posto)
dFrequencia.n.reclamacoes = table(BD03$n.reclamacoes)
cbind(frequencia = dFrequencia.n.reclamacoes)
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

plot(BD03$n.reclamacoes ~ BD03$valor.gasolina, 
     xlab = "valor da gasolina (R$)", 
     ylab = "nº de reclamações")
abline(lm(BD03$n.reclamacoes ~ BD03$valor.gasolina))

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

#séries temporais
gasolina.A = BD03$valor.gasolina[BD03$posto=="A"]
gasolina.B = BD03$valor.gasolina[BD03$posto=="B"]
gasolina.C = BD03$valor.gasolina[BD03$posto=="C"]
cbind(valor.gasolina.A = summary(gasolina.A), 
      valor.gasolina.B = summary(gasolina.B), 
      valor.gasolina.C = summary(gasolina.C))
#agrupando por unidade de tempo
diasSemana = weekdays(as.Date(BD03$data))
View(cbind(dia = diasSemana, data=as.character(BD03$data)))
boxplot(BD03$valor.gasolina~diasSemana)
diasSemana[diasSemana=="domingo"]=1#codificando
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
mesesDoAno[mesesDoAno=="fevereiro"]=2
mesesDoAno[mesesDoAno=="março"]=3
mesesDoAno[mesesDoAno=="abril"]=4
mesesDoAno[mesesDoAno=="maio"]=5
boxplot(BD03$valor.gasolina~mesesDoAno, xlab = "mês do ano", ylab = "valor da gasolina (R$)")
boxplot(BD03$valor.alcool~mesesDoAno, xlab = "mês do ano", ylab = "valor do álcool (R$)")
boxplot(BD03$n.reclamacoes~mesesDoAno, xlab = "mês do ano", ylab = "nº de reclamações")
#estudo diário
ts.plot(cbind(gasolina.A, gasolina.B, gasolina.C),
        gpars=list(xlab="", ylab="valor da gasolina (R$)", 
                   col=rainbow(3), lty=c(1:3), 
                   xaxt="n", lwd = 2))
legend("bottomleft", legend = names(table(BD03$posto)), 
       col = rainbow(3), lty=c(1:3), lwd = 2, bty = "n")
datas = names(table(BD03$data))
nDatas= length(datas); at_ = seq(1, nDatas, by = 7)
axis(side = 1,at = at_,  labels = datas[at_], las = 2)

#modelando via regressão linear
n = length(gasolina.A)
ut = gasolina.A[3:n]
ut_1 = gasolina.A[2:(n-1)]
ut_2 = gasolina.A[1:(n-2)]
data = datas[3:n]
gasolina.A_lag3 = data.frame(data, ut, ut_1, ut_2)
modelo.A.LM = lm(ut~ut_1+ut_2, 
                 data = gasolina.A_lag3)
summary(modelo.A.LM)
lm.coef = round(as.numeric(modelo.A.LM$coefficients), 2)
ts.plot(cbind(gasolina.A, c(rep(NA, 2), modelo.A.LM$fitted.values)), 
        gpars=list(xlab="", ylab="valor da gasolina em A (R$)", 
                   col=c("black", "red"), lty=c(1,2), 
                   xaxt="n", lwd = 2))
legend("bottomleft", legend = c(expression(paste("observado: ", u[t])), 
                                bquote(paste("previsto via LM:  ", hat(u)[t] == .(lm.coef[1]) + .(lm.coef[2])*u[t-1] + .(lm.coef[3])*u[t-2]))), 
       col = c("black", "red"), lty=c(1:2), lwd = 2, 
       bty = "n")
axis(side = 1,at = at_,  labels = datas[at_], las = 2)
#estudando o erro do modelo.A.LM
residuos.A.LM= modelo.A.LM$residuals
summary(residuos.A.LM)
mean.residuos.A.LM = mean(residuos.A.LM)
sd.residuos.A.LM = sd(residuos.A.LM)
ll = mean.residuos.A.LM - 3.5*sd.residuos.A.LM
ul = mean.residuos.A.LM + 3.5*sd.residuos.A.LM
curve(dnorm(x, mean = mean.residuos.A.LM, sd = sd.residuos.A.LM), 
      from = ll, to = ul, col = "blue", lwd=2, 
      xlab = "resíduo para A (observado - previsto via LM)", 
      ylab = "densidade")
hist(residuos.A.LM, freq = FALSE, add = TRUE)
sh.test = shapiro.test(residuos.A.LM)
text(x = .03, y = 15, adj=0, bquote(paste("p* = P(W>=",.(round(sh.test$statistic, 2)), ")=", .(round(sh.test$p.value, 2)))))

#modelagem via ARIMA
install.packages("forecast")
library("forecast")
set.seed(0)
modelo.A.ARIMA = auto.arima(y = gasolina.A, d = 1, max.q = 0)
summary(modelo.A.ARIMA)
ts.plot(cbind(gasolina.A, modelo.A.ARIMA$fitted), 
  gpars=list(xlab="", ylab="valor da gasolina em A (R$)", 
  col=c("black", "red"), lty=c(1,2), 
           xaxt="n", lwd = 2))
legend("bottomleft", legend = c(expression(paste("observado: ", u[t])), 
                                expression(paste("previsto via ARIMA:  ", hat(u)[t] == 1.52*u[t-1] - 0.52*u[t-2]))), 
       col = c("black", "red"), lty=c(1:2), lwd = 2, 
       bty = "n")
axis(side = 1,at = at_,  labels = datas[at_], las = 2)
#estudando o erro do modelo.A.ARIMA
residuos.A.ARIMA= modelo.A.ARIMA$residuals
summary(residuos.A.ARIMA)
mean.residuos.A.ARIMA = mean(residuos.A.ARIMA)
sd.residuos.A.ARIMA = sd(residuos.A.ARIMA)
ll = mean.residuos.A.ARIMA - 3.5*sd.residuos.A.ARIMA
ul = mean.residuos.A.ARIMA + 3.5*sd.residuos.A.ARIMA
curve(dnorm(x, mean = mean.residuos.A.ARIMA, sd = sd.residuos.A.ARIMA), 
      from = ll, to = ul, col = "blue", lwd=2, 
      xlab = "resíduo para A (observado - previsto via ARIMA)", 
      ylab = "densidade")
hist(residuos.A.ARIMA, freq = FALSE, add = TRUE)
sh.test = shapiro.test(residuos.A.ARIMA)
text(x = .03, y = 15, adj=0, bquote(paste("p* = P(W>=",.(round(sh.test$statistic, 2)), ")=", .(round(sh.test$p.value, 2)))))

#modelando via ANN
install.packages(neuralnet)
library(neuralnet)
min_ = min(gasolina.A_lag3[,2:4])
max_ = max(gasolina.A_lag3[,2:4])
normalized.gasolina.A_lag3 = (gasolina.A_lag3[,2:4] - min_)/(max_-min_)
modelo.A.ANN = neuralnet(ut~ut_1+ut_2, 
                         data = normalized.gasolina.A_lag3, 
                         linear.output = FALSE)
plot(modelo.A.ANN)
modelo.A.ANN$act.fct
modelo.A.ANN.forecasts = c(modelo.A.ANN$net.result[[1]]*(max_-min_) + min_)
View(cbind(gasolina.A_lag3, modelo.A.ANN.forecasts))
ts.plot(cbind(gasolina.A, c(NA, NA, modelo.A.ANN.forecasts)), 
        gpars=list(xlab="", ylab="valor da gasolina em A (R$)", 
                   col=c("black", "red"), lty=c(1,2), 
                   xaxt="n", lwd = 2))
legend("bottomleft", legend = c(expression(paste("observado: ", u[t])), 
                                expression(paste("previsto via ANN:  ", hat(u)[t] == f(u[t-1], u[t-2])))), 
       col = c("black", "red"), lty=c(1:2), lwd = 2, 
       bty = "n")
axis(side = 1,at = at_,  labels = datas[at_], las = 2)
#estudando o erro do modelo.A.ANN
residuos.A.ANN= gasolina.A_lag3$ut- modelo.A.ANN.forecasts
summary(residuos.A.ANN)
mean.residuos.A.ANN = mean(residuos.A.ANN, na.rm = TRUE)
sd.residuos.A.ANN = sd(residuos.A.ANN, na.rm = TRUE)
ll = mean.residuos.A.ANN - 3.5*sd.residuos.A.ANN
ul = mean.residuos.A.ANN + 3.5*sd.residuos.A.ANN
curve(dnorm(x, mean = mean.residuos.A.ANN, sd = sd.residuos.A.ANN), 
      from = ll, to = ul, col = "blue", lwd=2, 
      xlab = "resíduo para A (observado - previsto via ANN)", 
      ylab = "densidade")
hist(residuos.A.ANN, freq = FALSE, add = TRUE)
sh.test = shapiro.test(residuos.A.ANN)
text(x = .03, y = 15, adj=0, bquote(paste("p* = P(W>=",.(round(sh.test$statistic, 2)), ")=", .(round(sh.test$p.value, 2)))))

#resumindo desempenhos
cbind(residuos.A.LM = summary(residuos.A.LM), 
      residuos.A.ARIMA = summary(residuos.A.ARIMA), 
      residuos.A.ANN = summary(residuos.A.ANN))
residuos = data.frame(residuo=c(residuos.A.LM, residuos.A.ARIMA, residuos.A.ANN), 
                 modelo=c(rep("A.LM", length(residuos.A.LM)), 
                 rep("A.ARIMA", length(residuos.A.ARIMA)),
                 rep("A.ANN", length(residuos.A.ANN))))
boxplot(residuos$residuo ~residuos$modelo, xlab = "modelo de previsão para valor da gasolina em A", ylab = "resíduo")
rbind(EQM.residuos.A.LM = mean(residuos.A.LM^2), 
      EQM.residuos.A.ARIMA = mean(residuos.A.ARIMA^2), 
      EQM.residuos.A.ANN = mean(residuos.A.ANN^2))