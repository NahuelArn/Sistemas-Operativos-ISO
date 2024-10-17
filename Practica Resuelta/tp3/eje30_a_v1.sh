#!/bin/bash

ejecutables=$(ls *.sh)

direccion="/home"

if [ ! -d "$direccion"/bin ]; then #sino existe creo la carpeta bin
    mkdir "$direccion"/bin
fi

cant=0
for i in $ejecutables; do
    echo "nombre de ejecutable: $i"
    cant=$((cant+1))
    mv "$i" "$direccion"/bin
done

if [ cant -gt 0 ]; then
    echo "cantidad de ejectuables movidos: $cant"
else
    echo "no hay ningun ejecutable, por lo tanto no se movio ninguno."
fi


