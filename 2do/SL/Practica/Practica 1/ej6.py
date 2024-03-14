pares = []
impares = []
numeros = [-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9]

for num in numeros:
    if (num % 2 == 0 ):
        pares.append(num)
    else:
        impares.append(num)

print (f'Lista de numeros: \n {numeros}')
print (f'Lista de numeros pares: \n {pares}')
print(f'Lista de numeros impares: \n {impares}')

