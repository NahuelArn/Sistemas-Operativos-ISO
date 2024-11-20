#!/bin/bash

if [ $# -ne 3 ]; then
    echo "faltan paramtros... 1:ruta, 2: -a o -b, 3: Cadena"
    exit 1
fi

#renombrar
#1: ruta, 2:renombre
#si no existe el archivo regular
if [ ! -f "$1" ]; then
    echo "no existe el archivo"
    exit 1
fi

# Verificar que la cadena $3 ha sido proporcionada
if [ -z "$3" ]; then
    echo "Debe proporcionar una cadena para renombrar los archivos."
    exit 1
fi

case $2 in
    "-a")
        for i in $(ls "$1"); do
            if [ -f "$i" ]; then
                mv "$i" "$i$3"   
            fi
        done
        ;;

    "-b")
        #for i in $(ls "$1"); do
        for in in "$1"/*; do
            if [ -f "$1" ]; then
                mv "i" "$3$i"
            fi
        done
        ;;

    *)
        echo "opcion incorrecta"
        exit 1
        ;;

esac
exit 0
