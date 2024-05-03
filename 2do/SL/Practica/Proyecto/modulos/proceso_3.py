import csv
from pathlib import Path
def cambiar_coordenadas(coords):
    '''Esta funcion recibe coordenadas en formato GMS y devuelve su equivalente en latitud y longitud'''
    characters = ("'", "°", '"')
    coords_separadas = coords.split(" ")
    # Limpia los caracteres especiales
    for character in characters:
        coords_separadas[0] = coords_separadas[0].replace(character, " ")
        coords_separadas[1] = coords_separadas[1].replace(character, " ")
    coords_separadas[0] = coords_separadas[0].replace("Â", "")
    coords_separadas[1] = coords_separadas[1].replace("Â", "")
    # Crea listas para la conversion a GS (las listas contienen los grados, minutos y segundos)
    lat_valores = coords_separadas[0].split(" ")
    lon_valores = coords_separadas[1].split(" ")
    # Conversion a GS
    latitud = float(lat_valores[0]) + float(lat_valores[1]) / 60 + float(lat_valores[2]) / 3600
    longitud = float(lon_valores[0]) + float(lon_valores[1]) / 60 + float(lon_valores[2]) / 3600
    latitud = -latitud if lat_valores[3] == 'S' else latitud
    longitud = -longitud if lon_valores[3] == 'O' else longitud
    return latitud, longitud
def procesar_dataset_lagos(csv_ruta, csv_ruta_procesada):
    '''Esta función recibe la ruta del archivo csv a procesar, donde se le agregan 3 nuevas columnas: Sup tamaño, Latitud y Longitud, y se
    elimina la columna de coordenadas. Luego crea el nuevo csv y lo almacena en la ruta enviada por parametro'''
    with open(csv_ruta, newline="") as archivo:
        csv_reader = csv.reader(archivo)
        header = next(csv_reader)
        # Agrega las 3 columnas nuevas al header
        header.append("Sup tamaño")
        header.append("Latitud")
        header.append("Longitud")
        # Se elimina la columna de coordenadas
        header.pop(5)
        lista_actualizada = []
        lista_actualizada.append(header) 
        for fila in csv_reader:
            # Agrega el tamaño de superficie correspondiente
            tamaño = int(fila[2])
            if tamaño <= 17:
                fila.append("chico")
            elif tamaño <= 59:
                fila.append("medio")
            else:
                fila.append("grande")
            # Llama a la funcion cambiar_coordenadas y devuelve los valores de la latitud y longitud
            latitud, longitud = cambiar_coordenadas(fila[5])
            # Se eliminan los datos anterios de coordenadas
            fila.pop(5)
            # Se agregan la latitud y longitud a la fila
            fila.append(latitud)
            fila.append(longitud)
            # Se agrega la fila entera a la nueva lista para luego ser agregado a otro csv
            lista_actualizada.append(fila)
    # Se le asigna ruta al nuevo csv
    ruta_procesada = Path (csv_ruta_procesada) / "lagos_arg_procesado.csv"
    # Se copia la lista con el csv procesado al archivo nuevo
    with open(ruta_procesada, mode="w", newline="") as archivo_csv:
        csv_writer = csv.writer(archivo_csv)
        for fila in lista_actualizada:
            csv_writer.writerow(fila)