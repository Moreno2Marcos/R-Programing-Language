pib <- ts(read.delim2("pib_pt.csv", dec = ",", header = TRUE), start = 1991, frequency = 4)
pib <- pib[,-1]
Q <- ordered(cycle(pib))
pib.reg <- lm(pib~Q)
summary(pib)
plot(pib, bty = "l", lty = 1, main = "PIB brasileiro", ylab = "Indice", xlab = "Ano",
     col = "red")
