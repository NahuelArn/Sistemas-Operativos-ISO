#!/bin/bash

echo "Entiendo que ya lo hice??"
variable=$(ls | grep "eje20_a_v2")

echo "$variable"

if [ -n "$variable" ]; then
    echo "ARchivo encontrando... \n ejecutando..."
    bash "$variable"
else
    echo "No se encontro el archivo"
    exit 1
fi

