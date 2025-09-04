n = as.integer(readline("Número: "))

cat("Calculando o fatorial de ", n, "! = ", sep='')

fact = 1
for (i in n:1) {
    cat(i)
    cat(if (i > 1) " x " else " = ")
    
    fact = fact * i
}

cat(fact)