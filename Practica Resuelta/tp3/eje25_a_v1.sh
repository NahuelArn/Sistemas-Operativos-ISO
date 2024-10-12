#!/bin/bash


if [ $# -gt 2 ]; then
    echo "faltan parametros"
    exit 1
fi
vector=($(cat /etc/group | cut -d: -f1 | tr "," " "))
case $1 in
    "-b")
       #if (($# -eq 2 && $2 -gt -1)); then
       if [ $2 -gt -1 ]; then
            echo "el elemento en la pos $2 es: ${vector[$1]}"
        else
            echo "falta la posicion del arreglo como 2do argumento"
            exit 3
        fi
        ;;
    "-l")
        
        echo "longitud: ${#vector[@]}"
        ;;
    "-i")
        echo "${vector[@]}"
        ;;
    *)
        echo "Se introdujo un comando no valido"
        exit 1
        ;;
esac
