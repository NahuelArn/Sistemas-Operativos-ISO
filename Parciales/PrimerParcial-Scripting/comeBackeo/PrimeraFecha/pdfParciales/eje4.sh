#!/bin/bash

Inicializar(){
    array_vacio=()
}
#esta raro el nombre de la funcion, pero asi la pide
Agregar_elem(){
    if [ $# -ne 1 ]; then
        echo "no se recibio la pos ha aliminar"
        exit 1 #no aclara pero devuelvo el cod de error 1
    fi
    dimF=${#array_vacio[@]}
    posAeliminar=(($1 - 1 ))
    if [[ $1 -lt $dimF && $posAeliminar -gt 0 ]]; then #el usuario va tener q ingresar una pos de 1..N
           unset array_vacio[$posAeliminar]
           array_vacio=(${vector[@]})
    fi
}

Longitud(){
    echo "${#array_vacio[@]}"
    #esto siempre va devolver el codigo 0
}

Imprimir(){
    #no especifica como imprimir asi que imprimo todo el vector de una
    echo "${vector[@]}"
}

InicializarConValores(){
    if [ $# -ne 2 ]; then
        echo "faltan parametros... 1: valor a setear... 2: dimF"
        exit 1
    fi
    dimF=$2
    s=$1
    Inicializar
    for (( i=0; i < dimF; i++ )); do
        array_vacio+="($s)" 
    done
}

