# Estaciones Satelitales
Trabajo de la asignatura 'Sistemas Inteligentes'. Universidad de Cádiz.

Realizado por:
- Carlos Gallardo Polanco @gpcarlos95
- Aarón Arias Pérez @aaronariasperez

**Problema a resolver:**
En un espacio bidimensional *AxB* se han ubicado *N* posibles estaciones satelitales de las que
hay que seleccionar *M* estaciones representantes del resto no seleccionado *(N>M): S={R1,R2, ..., RM}.*
Una estación *Ri* del subconjunto *S*, es representante de otra estación no seleccionada cuando la distancia 
euclídea es menor que a cualquier otro miembro *Rj* de *S*. La posición de las *N* estaciones es fija y se 
establece al inicio del problema. Se pretende encontrar la combinación de estaciones representantes 
que minimicen la distancia euclídea global de este problema.


[Presentación](/Presentation/presentation.pdf)

**Para N=500 y M=40:**

Distribución de las representantes (puntos rojos) usando Simulated Annealing. 
<p align="center">
  <img width="560" height="400" src="/Presentation/images/mapSA.png">
</p>

Distribución de las representantes (puntos rojos) usando Algoritmo Genético. 
<p align="center">
  <img width="560" height="400" src="/Presentation/images/mapGA.png">
</p>