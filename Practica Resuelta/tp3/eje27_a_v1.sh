#!/bin/bash

if [ $# -gt 2 ]; then
    echo "Cantidad de parametros no valida"
    exit 1
fi

array_vacio=()

inicializar (){
    array_vacio=()
}

agregar_elem (){
    array_vacio+="$1"
}

eliminar_elem(){
    dimF=${#array_vacio[@]}
    if [ $# -ne 1 ]; then
        echo "cantidad de parametros no valida"
    elif (($1 -gt -1 && $1 -lt $dimF)); then
        unset array_vacio[$1]
    else
        echo "el indice esta fuera de rango"
    fi
}

longitud(){
    echo "longitud: ${#array_vacio[@]}"
}

imprimir(){
    echo "${array_vacio[@]}" #imprime todo el array
}

inicializar_Con_Valores(){
    if [ $# -ne 2 ]; then
        echo "cantidad de parametros erroneea"
        exit 1
    fi
    for ((i=0; i < $1; i++)); do 
        array_vacio[$i]=$2    
    done
}

select opcion in "inicializar" "agrega_elem" "eliminar_elem" "longitud" "imprimir" "inicializar_Con_Valores"; do
    case $opcion in
        "inicializar")
            inicializar
            ;;
        "agrega_elem")
            agregar_elem $1
            ;;
        "longitud")
            longitud
            ;;
        "imprimir")
            imprimir
            ;;
        "inicializar_Con_Valores")
            inicializar_Con_Valores $1 $2
            ;;
        *)
            echo "se ingreso una opcion invalida"
            exit 1
    esac
done

