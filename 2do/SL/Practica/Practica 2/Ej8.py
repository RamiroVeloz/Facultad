import string

def heterogram (word):
    not_char = string.digits + string.punctuation + ' '
    flag = True
    for letter in word:
        if not (letter in not_char):
            if word.count(letter) > 1:
                flag = False
    return flag


word = input ('Ingrese una palabra: ')
value = heterogram (word)
if value :
    print('La palabra o frase es un heterograma')
else:
    print('La palabra o frase no es un heterograma')