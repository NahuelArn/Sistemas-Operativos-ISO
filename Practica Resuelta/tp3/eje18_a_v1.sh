#!/bin/bash

#Verifico que me pasen la cantidad exacta de argumentos
if [ $# -ne 1 ]; then
    echo "Se necesita el argumento 'Usuario' "
    exit 1
fi

prosiga=true
while [ "$prosiga" == true ]; do
    #Verifico que el usuario este logueado
    #Falla si hay varios usuarios con el mismo $1 y si no hay usuarios compara contra nada
    #if [ "$1" == "$(who | cut -d" " -f1 | grep $1) "]; then 
    if  who | cut -d" " -f1 | grep -q "^$1$"; then
        echo "Usuario $1 logueado en el sistema"
        prosiga=false
        exit 0
    else
        echo loading...
        sleep 10 
    fi
done

