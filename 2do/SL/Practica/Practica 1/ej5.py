entrada = input("Por favor, ingresa una lista de números separados por espacios: ")
numeros_str = entrada.split(" ")
numeros = []
for num in numeros_str:
    numeros.append(int(num))
print("Lista de números ingresada:", numeros)

for numero in numeros:
    if numero >= 0 :
        print(numero)
        continue
    else:
        break