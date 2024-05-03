from collections import Counter

def check_string (text,op):
    ctr = Counter()
    list = text.lower().split()
    for word in list:
        ctr [word] +=1
    if (op in ctr):
        return ctr[op]
    else:
        return 0

text = """Tres tristes tigres, tragaban trigo en un trigal, en tres tristes
trastos, tragaban trigo tres tristes tigres."""

op = input ('Ingrese una palabra para buscar en la frase: ')
value = check_string(text,op)
print (value)