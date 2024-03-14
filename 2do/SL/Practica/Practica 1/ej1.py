cien = 100
edad = int (input('Ingrese su edad: '))
if edad > 100:
    resto = edad - cien
else:
    resto = cien - edad
print (f'Al usuario le faltan {resto} para llegar a los {cien} anios')