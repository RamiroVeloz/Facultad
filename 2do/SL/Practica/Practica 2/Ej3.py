def letter_count (text,choice):
    cant = text.count(choice)
    return cant

jupyter_info = """ JupyterLab is a web-based interactive development
environment for Jupyter notebooks, code, and data. JupyterLab is
flexible: configure and arrange the user interface to support a wide
range of workflows in data science, scientific computing, and machine
learning. JupyterLab is extensible and modular: write plugins that add
new components and integrate with existing ones. """

choice = input('Ingrese una letra:')

cant = letter_count(jupyter_info,choice)

print(f'La cantidad de ocurrencias que tiene la letra {choice} en el texto es: {cant}') 