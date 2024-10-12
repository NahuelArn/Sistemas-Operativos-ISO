#!/bin/bash

vector1=(1 80 65 35 2)

vector2=(5 98 3 41 8)

dimf=${#vector1[@]}

for (( i=0; i<dimf; i++)); do
    #echo "hola"
    echo "la suma de la pos: $i: de los vectores es $((${vector1[$i]} + ${vector2[$i]}))"
done
