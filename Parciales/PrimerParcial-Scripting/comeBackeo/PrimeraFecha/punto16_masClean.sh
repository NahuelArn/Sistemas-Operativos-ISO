#!/bin/bash

vector=($(cat /etc/passwd | cut -d : -f1))
existe(){
    if [[ $# -eq 0 || ${#vector[@]} -eq 0 ]]; then
        echo "sin parametros"
        return 1
    fi
    
    if  echo ${vector[@]} | grep -q "$1"; then
        echo "existe"
        return 0
    else
        echo "no existe"
        return 1
    fi
}

existe $1
