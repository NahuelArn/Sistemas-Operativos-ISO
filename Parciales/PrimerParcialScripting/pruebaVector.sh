#!/bin/bash

borrar_gz(){
    dimF=${#vector[@]}  # Tamaño del vector
    i=0
    while [[ $i -lt $dimF ]]; do
        if [[ "${vector[i]}" == *.gz ]]; then
            unset vector[i]  # Borrar el archivo con extensión .gz
        fi
        i=$((i+1))  # Incrementar el índice
    done

    # Reindexar el arreglo para eliminar huecos
    vector=("${vector[@]}")
}



# Vector con archivos
vector=("archivo1.txt" "archivo2.gz" "archivo3.doc" "archivo4.gz")
echo "tamanho anterior: ${#vector[@]}"
# Llamar a la función para eliminar los archivos .gz
#borrar_gz

# Mostrar el vector actualizado
#echo "Vector actualizado: ${vector[@]}"

#echo "tamanho nuevo: ${#vector[@]}"


echo "-----------------------------------"

vector2=("1.txt" "2.gz" "3.gz" "4.txt")
echo "antes de entrar ${#vector2[@]} contenido: ${vector2[@]}"
dimF=${#vector2[@]}  # Tamaño del vector
i=0
iteracion=1
while [[ $i -lt $dimF ]]; do
    echo "--- valor del indice: $i ----- iteracion: $iteracion"
    if [[ "${vector2[i]}" == *.gz ]]; then
        #echo "--- valor $i ----- iteracion: $iteracion"
        #iteracion=$((iteracion+1))
        echo "dimF: ${#vector2[@]} contenido: ${vector2[@]}     contenido del vector en $i --- ${vector2[i]}"
        unset vector2[i]  # Borrar el archivo con extensión .gz
        echo "dimF: ${#vector2[@]} contenido: ${vector2[@]}  contenido del vector en post $1 --- ${vector2[i]}"
        sleep 3
        dimF=$((dimF-1))

    fi
    iteracion=$((iteracion+1))
    #i=$((i+1))  # Incrementar el índice
    ((i++))
done

echo "final:  ${vector2[@]}"
vector2=("${vector2[@]}")

#echo "reindexado:         ${vector2[@]}     y dimf: ${#vector2[@]}"

echo "pos1: ${vector2[0]}     pos2: ${vector2[1]}"
sleep 2
echo "me rompo ${vector2[2]}"
