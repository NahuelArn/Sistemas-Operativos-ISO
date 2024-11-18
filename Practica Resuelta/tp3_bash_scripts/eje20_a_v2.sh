#!/bin/bash

vector=();

pusheo (){
    if [ $# -ne 1 ]; then
        echo "No se paso ningun parametro, para pushear"
        exit 1
    else
        vector+=("$1")
    fi
}

popeo (){
    if [ ${#vector[@]} -ne 0 ]; then
        #echo " ${vector[0]} " cola
        echo "vector[${#vector[@]}]"
        #unset vector[0] cola
        unset vector[$((${#vector[@]} - 1))]
        #vector=("${vector[@]}") #Hace los corrimientos hacia la izquierda
        
    else
        echo "La Pila esta vacia"
        exit 1
    fi
}

lenghteo (){
    echo "dimf: ${#vector[@]}"
    exit 0;
}

printeo (){
    echo "los elementos son: ${vector[@]}"
}

#Menu
select opcion in "push" "pop" "lenght" "print"; do
    case $opcion in
        "push")
            echo "Ingrese el parametro a pushear"; read a
            pusheo "$a"
            ;;
        "pop")
            popeo
            ;;
        "lenght")
            lenghteo
            ;;
        "print")
            printeo
            ;;
        *)
            echo "Opcion invalida"
            ;;
    esac
done

exit 0

