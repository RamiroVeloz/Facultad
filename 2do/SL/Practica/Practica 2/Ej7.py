import string
def lower_letters (text):
    lowers = string.ascii_lowercase + 'áéíóú' + 'ÁÉÍÓÚ'
    low = 0
    for letter in text:
        if letter in lowers:
            low += 1
    print(low)


def upper_letters (text):
    uppers = string.ascii_uppercase
    up = 0
    for letter in text:
        if letter in uppers:
            up += 1
    print(up)

def non_letters (text):
    nolet = string.digits + string.punctuation
    no = 0
    for letter in text:
        if letter in nolet:
            no +=1
    print(no)
text = """ La brecha salarial alcanzó el 27,7%: las mujeres ocupadas
debieron trabajar 8 días y 10 horas más que los varones ocupados para
ganar lo mismo que ellos en un mes. """

lower_letters(text)
upper_letters(text)
non_letters(text)