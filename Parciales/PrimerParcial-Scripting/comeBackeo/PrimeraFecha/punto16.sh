#!/bin/bash

vector=($(cat /etc/passwd | cut -d : -f1));

existe(){
    if [[ ${#vector[@]} -lt 1 || $# -eq 0 ]]; then
        echo "vector vacio o cant parametros 0"
        return 1
    fi

    encuentra="false"
    dimF=${#vector[@]}
    i=0
    while [[ $i -lt  $dimF && "$encuentra" == "false" ]]; do
        if [ ${vector[$i]} = "$1" ]; then
            encuentra="true"
        else
            ((i++))
        fi
    done

    if [ $encuentra = "true" ]; then
        echo "encontrado"
        return 0
    fi
    return 1
}
existe $1
