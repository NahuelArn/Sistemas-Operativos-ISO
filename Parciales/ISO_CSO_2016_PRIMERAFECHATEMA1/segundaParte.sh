#!/bin/bash

#vector=($(ls /var/log | grep "access" | cut -d . -f1))
vector=($(ls /var/log | grep "access" ))
cantidad(){
    echo "cantidad: ${#vector[@]}" 
}

listar(){
    #echo "nombre de todos los archivos: ${vector[@]}" | cut -d . -f1
    ls /var/log | cut -d . -f1
}

eliminar(){
    if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "error se esperaban 2 parametros.. indice, caracter"
        return 1
    fi
    #evaluo el primer parametro
    if [[ $1 -gt -1 && $1 -le ${#vector[@]} ]]; then
        case "$2" in
            "I")
                unset vector[$1]
                vector=("${vector[@]}")
                return 0
                ;;
            "F")
                rm /var/log/"${vector[$1]}"
                unset vector[$1]
                vector=("${vector[@]}")
                return 0
                ;;
            *)
                echo "error no se paso I o F"
                return 3
                ;;
        esac
    else
        return 2
    fi
    
}
select opcion in "cantidad" "listar" "eliminar" "fin"; do
    case "$opcion" in
        "cantidad")
            cantidad
            ;;
        "listar")
            listar
            ;;
        "eliminar")
            echo "ingrese el indice ha eliminar del vector"
            read indice
            echo "ingrese 'I' para borrarlo logicamente y 'F' para borrarlo Fisicamnete"
            read caracter
            eliminar $indice $caracter
            if [ $? -ne 0 ]; then
                echo "ocurrio un error en la funcion eliminar"
                exit 2
            fi
            ;;
        "fin")
            exit 0
            ;;
        *)
            echo "error flaquito"
            echo "me rompo en 3"
            sleep 1
            echo "me rompo en 2"
            sleep 1
            echo "me rompo en 1"
            sleep 1
            echo "0.. me rompi"
            exit 1
            ;;
    esac
done
