#!/bin/bash


pepe (){
    if [ $# -eq 2 ]; then
        echo "hola"
        return 0
    else
        return 5
    fi
}

echo "funcion principal"

pepe 1 2

if [ $? -eq 0 ]; then
    echo "salio bien"
else
    echo "salio mal"
fi

echo "salio bien"
