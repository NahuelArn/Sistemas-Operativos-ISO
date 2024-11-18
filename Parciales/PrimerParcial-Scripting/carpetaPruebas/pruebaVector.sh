#!/bin/bash

imprimir(){
    vectorNuevo=("${!1}")  # Usa "${!1}" para acceder al array pasado como argumento
    echo "nuevo: ${vectorNuevo[@]}"

}

vector=($(cat /etc/group | cut -d : -f1))

imprimir vector[@]  # Pasas el array con la sintaxis correcta

