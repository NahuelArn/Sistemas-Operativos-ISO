#!/bin/bash
echo "Antes del cambio $(ls)"
echo ""

#Itero sobre todos los archivos, de la ruta donde estoy parado
#for nombre_actual in $(ls); do
for nombre_actual in *; do
    if [ -f "$nombre_actual" ]; then
        #echo "$nombre_actual" | cut -d. -f1 | tr 'a-z' 'A-Z' | tr -d 'aA' > nombre_simple  
        #SI lo hago asi estoy creando un archivo, necesito una variable
        #cat nombre_simple
        nombre_modificado=$(echo "$nombre_actual" | cut -d. -f1 | tr 'a-z' 'A-Z' | tr -d 'aA')
        echo "$nombre_modificado"
    fi
done


#wikipedia
#https://geekland.eu/uso-del-comando-tr-en-linux-y-unix-con-ejemplos/
