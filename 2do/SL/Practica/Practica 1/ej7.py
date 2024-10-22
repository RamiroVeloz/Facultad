#Escribe un programa que tome una lista de números enteros como entrada del usuario.
#Luego, convierte cada número en la lista a string y únelos en una sola cadena,
#separados por guiones ('-'). Sin embargo, excluye cualquier número que sea múltiplo
#de 3 de la cadena final.

numeros = []
cadena = ""
num = int(input('Ingrese un numero: '))
while (num != -1):
    numeros.append(num)
    num = int(input('Ingrese un numero: '))

for x in numeros:
    if (x % 3 != 0):
        car = str(x)
        cadena += (f'{x}-')
        continue

print(f'Lista de numeros en cadena: \n {cadena}')