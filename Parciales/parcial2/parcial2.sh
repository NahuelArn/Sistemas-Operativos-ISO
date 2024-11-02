#!/bin/bash

vector=($(cat /etc/passwd | cut -d : -f1))

#funciones

listar(){
    dimF=${#vector[@]}
    for (( i=0; i < dimF; i++ )); do
        echo -e "indice: $i contenido ${vector[$i]} \n"
    done
}

eliminar(){
    if [ $# -ne 0 ]; then
        return 1
    fi
    dimF=${vector[@]}
    if [[ $1 -gt -1 && $1 -le $dimF ]]; then
        unset vector[$1]
        vector=(${vector[@]})
        return 01
    fi
    return 1
}
select opcion in "listar" "eliminar" "contar"; do
    case $opcion in 
        "listar")
            listar
            exit 0
            ;;
        "eliminar")
            listar
            echo "ingrese el indice a eliminar"
            read indice
            eliminar $indice
            if [ $? -eq 0 ]; then
                exit 0
            else
               exit 1
            fi
            ;;
        "contar")
            echo "cantidad de elementos de un arreglo: ${vector[@]}"
            exit 0
            ;;
        *)
            exit 0
            ;;
    esac
done
