#!/bin/bash

if [ $# -ne 1 ]; then    
    echo "error, se esperaba un parametro"
    exit 4
fi

if [ -d $1 ]; then
    pushd $1 > /dev/null
    cantidad=$(ls -p | grep -v / | wc -l) 
    # find . -maxdepth 1 -type f | wc -l # busco todos el contenido, de la profundidad actual 1, de tipo archivo y lo paso como entrada a la pipeline para que lo cuente
    popd > /dev/null
    echo "la cantidad de archivos en el directorio: $1 es $cantidad"
else
    echo "no existe el directorio: $1"
    exit 4
fi

