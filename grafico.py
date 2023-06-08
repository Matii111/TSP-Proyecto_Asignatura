import re

# Leer el archivo original
nombre_archivo_original = "resultados.txt"

with open(nombre_archivo_original, 'r') as archivo_original:
    lineas = archivo_original.readlines()

# Buscar los números en las líneas correspondientes
resultados = {}
algoritmo_actual = None

for linea in lineas:
    linea = linea.strip()

    if re.match(r"^-+RESULTADOS-GRASP-+", linea):
        algoritmo_actual = "GRASP"
    elif re.match(r"^-+RESULTADOS-Simulated_Annealing-+", linea):
        algoritmo_actual = "Simulated_Annealing"
    elif re.match(r"^-+RESULTADOS-ACO-+", linea):
        algoritmo_actual = "ACO"
    else:
        match = re.search(r"Costo del mejor recorrido \((.*?)\): (\d+\.\d+)", linea)
        if match and algoritmo_actual:
            algoritmo_nombre = match.group(1)
            costo = float(match.group(2))

            if algoritmo_actual in resultados:
                resultados[algoritmo_actual].append((algoritmo_nombre, costo))
            else:
                resultados[algoritmo_actual] = [(algoritmo_nombre, costo)]

# Escribir los resultados en un nuevo archivo
nombre_archivo_nuevo = "costo_mejor_recorrido.txt"

with open(nombre_archivo_nuevo, 'w') as archivo_nuevo:
    for algoritmo, valores in resultados.items():
        archivo_nuevo.write(f"{algoritmo}:\n")
        for algoritmo_nombre, costo in valores:
            archivo_nuevo.write(f"{algoritmo_nombre}: {costo}\n")
        archivo_nuevo.write("\n")

print("Se han extraído y ordenado los números de costo del mejor recorrido por algoritmo en el archivo nuevo:", nombre_archivo_nuevo)
