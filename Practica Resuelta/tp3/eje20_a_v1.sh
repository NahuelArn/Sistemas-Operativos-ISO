#!/bin/bash

#if [ #$ -ne ]; then
#    echo "Cantidad de parametros no clara, (Push, Pop, Lenght, Print)"
#    exit 1
#fi

#SOy re troll, pedia una pila pero hice una QUeue
vector=();

pusheo (){
    echo "Ingrese el elemento a pushear"
    read sarasa
    size=${#vector[@]}+1
    #vector+=("$sarasa") preguntar si esta es una forma valida de agregar en un vector
    vector[size]=sarasa
    exit 0
}

popeo(){
    if [ ${#vector[@]} -gt 0 ]; then
        echo "${vector[0]}"
        unset vector[0]
        vector=("${vector[@]}") #Reindexa los elementos, hace los corriemientos
        exit 0
    else
        echo "error 444"
        exit 1
    fi
}

lenghteo (){
    echo " ${#vector[@]} " 
    exit 0
}

printlneo (){
    for i in ${vector[@]} do
        echo "Elemento: $i"
    done
}

select opcion in "push" "pop" "lenght" "print"; do
    case $opcion in
        "push")
            pusheo 
            ;;
        "pop")
            popeo
            ;;
        "lenght")
            lenghteo
            ;;
        "print")
            printlneo
            ;;
        *)
            echo "Error flaquito"
            exit 1
            ;;
    esac
done


