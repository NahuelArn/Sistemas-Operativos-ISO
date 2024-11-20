#!/bin/bash

if [ $# -eq 0 ]; then
    echo "faltan parametros"
    exit 1
fi

vector=($@)
cont=0
for i in $(cat ${vector[@]}); do
#for i in "$@"; do  #es equivalente
    if [ -e "$i" ]; then
        #gzip $i #asi borro el archivo original y lo dejo comprimido
        if [ -f "$i" ]; then
            gzip "$i"
        
        elif [ -d "$i" ]; then
            if [ -r "$i" ]; then
                tar -czvf "$i.tar.gzip" "$i" 
            fi
            if [ -w "$i" ]; then
                rm -rf $i
            fi
        fi
    else
        ((cont++))
    fi
    
done

echo "la parametros no existentes en el file system es: $cont"
exit 0
