#!/bin/bash

#Funciones q realizan operaciones aritmeticas
suma(){
    echo " $1 + $2 = $(($1 + $2))" 
}

resta(){
    echo "$1 - $2 = $(($1 - $2))"
}

division (){
    if [[ $# -eq 2 && $2 -ne 0 ]]; then
        echo "$1 - $2 = $(($1 / $2))"
        exit 0
    else
        exit 1
    fi
}

multiplicacion (){
    if [ $# -eq 2 ]; then
        echo "$1 * $2 = $(($1 * $2))"
        exit 0
    else
        exit 1
    fi
}

porcentaje(){
    if [ $# -eq 2 ]; then
        echo "$1 % $2 = $(($1 % $2))"
        exit 0
    else
        exit 1
    fi
}
#Pido valores
read -p "Ingrese un numero: " nro1
#echo "Seleccione una opcion"
#select operando in "+" "-" "*" "%" "/"

read -p "Seleccione un operando: (+, -, *,/, % ) " operando

read -p "Ingrese un numero: " nro2

#Loopea mientras el usuario quiera seguir aplicando operaciones al numero
#La condicion de pedir data se puede mejorar
salir=false
while [ "$salir" == false ]; do
    case $operando in
        "+")
           suma $nro1 $nro2
           #nro1 = $(($nro1 + $nro2)) # no puede tener espacios entre el  =
           nro1=$(($nro1 + $nro2)) 
            ;;
        "-")
            resta $nro1 $nro2
            nro1=$(($nro1 - $nro2))
            ;;
        "/")
            division $nro1 $nro2
            nro1=$(($nro1 / $nro2))
            ;;
        "*")
            multiplicacion $nro1 $nro2
            nro1=$(($nro1 * $nro2))
            ;;
        "%")
            porcentaje $nro1 $nro2
            nro1=$(($nro1 % $nro2))
    esac
    echo "Desea salir? (s/n)"
    read estado
    if [ "$estado" == "s" ]; then
        salir=true
    else
        read -p "Ingrese un numero: " nro2
        read -p "Ingrese un operando (+, -, *, /, %)" operando
    fi
done

