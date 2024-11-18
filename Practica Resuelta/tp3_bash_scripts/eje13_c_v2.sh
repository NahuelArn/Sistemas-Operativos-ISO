#!/bin/bash
#Este script espera recibir en la llamada un argumento
#Busca si en el directorio actual hay una carpeta o archivo con el nombre pasado por argumento

#Verifica si existe (todavia no sabe si es un directorio o archivo)
if [ $# -ne 1 ]; then
    echo "No se paso ningun argumento"; 
fi

#Verifico si el archivo o directorio existe
if [ -e $1 ]; then
    if [ -d $1 ]; then
        echo "el nombre $1 es de un directorio. "
    elif [ -f $1 ]; then
        echo "El nombre $1 es de un archivo. "
    else
        echo "EL nombre $1 no es de un archivo, ni de un directorio."
        exit 1
    fi
else    #Sino existe creo un directorio con ese nombre
    echo "el nombre $1 no existe, se va crear un directorio con ese nombre"
    echo "creando.... $(mkdir $1)"
    echo "Directorio creado. "
    exit 0
fi
