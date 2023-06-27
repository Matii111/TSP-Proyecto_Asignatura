
# Proyecto de asignatura - Investigación *Traveling Salesman Problem* (TSP)

Dentro del presente repositorio estarán incluidos los archivos de código implementados para la investigación del TSP o "problema del vendedor viajero".

## Implementaciones en código
### TSP en Python
Dentro del archivo [**TSP.ipynb**](https://githu**b.com/Matii111/TSP-Proyecto_Asignatura/blob/master/TSP.ipynb) esta la implementación del *Traveler Salesman Problem* en **Jupyter Python** a modo de ejemplo inicial.

#### Paquetes requeridos
```
pip install matplotlib
```

### Heurísticas y metaheurísticas para TSP en Julia
Los archivos dentro de la carpeta  [**Julia**](https://github.com/Matii111/TSP-Proyecto_Asignatura/tree/master/Julia) son los códigos de las implementaciones de las metaheurísticas [**GRASP.jl**](https://github.com/Matii111/TSP-Proyecto_Asignatura/blob/master/Julia/GRASP.jl) (*Greedy Randomized Adaptive Search Procedure*), [**SA.jl**](https://github.com/Matii111/TSP-Proyecto_Asignatura/blob/master/Julia/SA.jl) (*Simulated Annealing*) y la heuristica [**ACO.jl**](https://github.com/Matii111/TSP-Proyecto_Asignatura/blob/master/Julia/ACO.jl) para (*Ant Colony Optimization*) para resolver el **TSP**.

Además, dentro del archivo [**main**](https://github.com/Matii111/TSP-Proyecto_Asignatura/blob/master/Julia/main.jl) son llamados los códigos de cada algoritmo con el fin de comparar sus rendimientos respectivos y mostrarlos en pantalla.

## Análisis de los resultados 

### Gráficos comparativos
Los resultados obtenidos por las algoritmias son posteriormente analizados dentro del informe en **LaTeX**, y los resultados son interpretados mediante gráficos en Python, estos gráficos son generados en el archivo [**gráficos.ipynb**](https://github.com/Matii111/TSP-Proyecto_Asignatura/blob/master/Python/graficos.ipynb).

#### Datos de los gráficos
Toda la información pertinente a los gráficos se encuentra almacenada dentro de la carpeta [**data_test**](https://github.com/Matii111/TSP-Proyecto_Asignatura/tree/master/Python/data_test), el significado de cada valor es explicado en profundidad dentro del informe.

## Formato del informe
Toda la investigación esta documentada en profundidad dentro del informe elaborado mediante LaTeX, el formato del mismo esta dentro de la carpeta del mismo nombre [**Latex**](https://github.com/Matii111/TSP-Proyecto_Asignatura/tree/master/Latex). El documento en formato LaTeX genera el siguiente archivo [**PDF**](https://github.com/Matii111/TSP-Proyecto_Asignatura/files/11885063/Proyecto_de_asignatura___Vendedor_viajero.pdf).
