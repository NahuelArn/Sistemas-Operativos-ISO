#!/bin/bash

# Verifica si se pasó un parámetro
if [ $# -ne 1 ]; then
    echo "error, se esperaba un parametro"
    exit 4
fi

# Verifica si el parámetro es un directorio
if [ -d "$1" ]; then
    pushd "$1" > /dev/null  # Cambiar al directorio y suprimir la salida
    #cantidad=$(ls -p | grep -v / | wc -l)
    cantidad=$(ls -l | grep '^-rw' | wc -l)
    popd > /dev/null  # Regresar al directorio anterior y suprimir la salida
    #echo "la cantidad de archivos en el directorio: $1 es $cantidad"
else
    echo "no existe el directorio: $1"
    exit 4
fi
echo "la cantidad de archivos en el directorio: $1 es $cantidad"

