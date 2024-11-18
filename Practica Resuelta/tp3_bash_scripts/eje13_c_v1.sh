#!/bin/bash

#El script va esperar recibir un argumento, que va ser pasado cuando se escriba
# ./eje13_c_v1.sh nombreDelArchivo

#Verifico que se paso un argumento
if [ $# -ne 1 ]; then #Si no es igual a 1
    echo "Ingrese un nombre de un archivo"; exit 1
fi

#Verifico si el archivo directorio existe
if ! [ -e $1 ]; then #Si no existe el archivo
    $(mkdir $1) #lo crea sino existe
elif [ -f $1 ]; then #si es un archivo regular (txt,bin,bash,etc etc)
    echo "El nombre $1 es un archivo. "
elif [ -d $1 ]; then #Si es un directorio
    echo "El nombre $1 es un directorio
else 
    echo "No es un directorio ni un archivo"
fi


