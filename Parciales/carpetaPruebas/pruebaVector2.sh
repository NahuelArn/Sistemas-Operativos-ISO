#!/bin/bash

# Crear un array con 5 elementos
vector=(10 20 30 40 50)

# Eliminar el 2° y 3° elementos (índices 1 y 2 en un array 0-indexado)
unset vector[1]  # Eliminar el segundo elemento
unset vector[2]  # Eliminar el tercer elemento (que se ha corrido después de la primera eliminación)
echo "despues de eliminar la pos, 1 y 2"
echo -e "antes.... vect0: ${vector[0]} vect1: ${vector[1]} vect2: ${vector[2]} vect3: ${vector[3]} vect4: ${vector[4]}\n"

# Reindexar el array
vector=("${vector[@]}")
echo -e "medio.... vect0: ${vector[0]} vect1: ${vector[1]} vect2: ${vector[2]} vect3: ${vector[3]} vect4: ${vector[4]}\n"

# Imprimir el nuevo array
echo "Nuevo vector: ${vector[@]}"
echo -e "end.... vect0: ${vector[0]} vect1: ${vector[1]} vect2: ${vector[2]} vect3: ${vector[3]} vect4: ${vector[4]}\n"


