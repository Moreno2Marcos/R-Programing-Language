# Calculando a transposta de B.
print(B)
print(t(B))

# Inversão de matriz (inversa). Condição de cálculo de inversa é que a
# matriz seja quadrada.
C <- matrix(c(1, 3, 5, 2, 6, 7, 8, 3, 9), ncol=3)
print(C)
print(solve(C))

# Função para saber a dimensão de uma matriz.
print(dim(C))

# Função que calcula o determinante de uma matriz.
print(det(C))

# Condição para inverter uma matriz é que seu determinante seja != 0
#D <- matrix(1:16, 4, 4)
#print(D)
#print(det(D))
#print(solve(D))

# Extraindo a diagonal de uma matriz.
print(diag(A))
print(A)