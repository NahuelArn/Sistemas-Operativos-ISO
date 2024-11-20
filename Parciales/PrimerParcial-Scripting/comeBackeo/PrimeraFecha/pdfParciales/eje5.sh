#!/bin/bash

if [ $# -ne 1 ]; then
    echo "falta un parametro"
    exit 4
fi

if [ ! -d $1 ]; then
    exit 4  
fi

cont=0

for i in "$1"/*; do
    if [ -f $i ]; then
        if [[ -w $i && -r $i ]]; then
            ((cont++))
        fi
    fi

done

echo "cant $cont"
#cont=$(find "$1" -maxdepth 0 -type d | wc -l)  

