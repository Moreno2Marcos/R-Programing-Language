print("Analizador de Triângulos")

l1 = readline("1er segmento? ")
l2 = readline("2do segmento? ")
l3 = readline("3er segmento? ")

l1 = as.double(l1)
l2 = as.double(l2)
l3 = as.double(l3)

if ((l1 < l2 + l3) & (l2 < l1 + l3) & (l3 < l1 + l2)) {
    saida = "Os segmentos acima PODEM FORMAR um triângulo"
    if ((l1 == l2) & (l2 == l3)) {
        cat(saida, "Equilátero")
    } else if ((l1 != l2) & (l2 != l3) & (l1 != l3)) {
        cat(saida, "Escaleno")
    } else {
        cat(saida, "Isósceles")
    }
} else {
    print("Os segmentos acima NÃO PODEM FORMAR um triângulo")
}