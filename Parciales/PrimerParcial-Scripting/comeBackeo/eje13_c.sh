#!/bin/bash

if [  $# -ne 1 ]; then
    echo "falta el nombre del archivo"
    exit 1
fi

if [ -e "$1"  ]; then
    echo "existe el archivo: $1"
    if [ -f "$1" ]; then
        echo "es un archivo regular"
    elif [ -d "$1" ]; then
        echo "es un directorio"
    fi
    mkdir "$(pwd)/$1"
    exit 0
else
    echo "no existe el archivo: $1"
    exit 1
fi



