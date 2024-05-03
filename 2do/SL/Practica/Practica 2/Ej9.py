import string

def calculate_score (letter):
    scores = {'A' : 1,'E' : 1,'I': 1,'O' : 1,'U' : 1,'N' : 1,'R' : 1,'S' : 1,'T' : 1,
    'D' : 2,'G' : 2,
    'B' : 3,'C' : 3,'M' : 3,'P' : 3,
    'F' : 4,'H' : 4,'V' : 4,'W' : 4,'Y' : 4,
    'K' : 5,
    'J' : 8,'X' : 8,
    'Q' : 10,'Z' : 10}

    point = 0

    if (letter in scores):
        point = scores[letter]
    
    return point


def analize_text (text):
    points = 0
    not_char = string.digits + string.punctuation + ' '
    for letter in text:
        letter = letter.upper()
        if not (letter in not_char):
            aux = calculate_score(letter)
            points += aux
    return points

text = input ('Ingrese una palabra: ')
points = analize_text(text)
print(f'El puntaje de la palabra ingresada es: {points}')