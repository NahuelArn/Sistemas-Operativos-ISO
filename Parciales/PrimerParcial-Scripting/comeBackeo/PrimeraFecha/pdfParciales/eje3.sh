#!/bin/bash

if [ $# -lt 1 ]; then
    echo "cant minima de parametros no recibida"
    exit 0
fi

i=1
cantD=0
cantA=0
for r in "$@"; do
    if ((  $i % 2 != 0 )); then
        if [ -e "$r" ]; then
            if [ -f "$r" ]; then
                echo "existe el archivo"
            fi
            if [ -d "$r" ]; then
                echo "existe el directorio"
            fi
        else
            if [[ "$r" == */ ]]; then
                ((cantA++))#es directorio
            else
                ((cantD++))
            fi
        fi
    fi
    ((i++))
done

echo "la cantidad de directorios inexistentes es: $cantD y de archivos inexistentes es: $cantA"
