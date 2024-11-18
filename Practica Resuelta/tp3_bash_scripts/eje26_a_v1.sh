#!/bin/bash

if [ $# -lt 1 ]; then
    echo "error en el ingreso de parametros" 
    exit 1    
fi

dimf=$#

for (( i=0; i < dimf; i++ )); do 
    #if (( !((i%2 == 0)) && -d "$i" )); then
    if (( (i+1) % 2 != 0 )); then
        if [ -d "${!i}" ]; then
            echo "es un directorio"
        elif [ -f "${!i}" ]; then
            echo "es un archivo regular"
        fi
    fi
done
echo "$dimf"

#para probarlo, devuelve bien el valor, 1 regular y 1 directorio cant 3
#/eje26_a_v1.sh /home/nahuelarn/practica-1-shell-iso/reporte.txt /home/nahuelarn/practica-1-shell-iso /home/nahuelarn/practica-1-shell-iso
