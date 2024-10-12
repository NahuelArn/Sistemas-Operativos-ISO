#!/bin/bash

vector=(1 2 3 4 5 6 7 8)
contImp=0
for i in ${vector[@]}; do
    if (($i % 2 == 0)); then
        echo "el nro $i es un nro par"
    else
        contImp=$(($contImp + $i))
    fi
done

if [ $contImp -ne 0 ]; then
    echo "La suma de los impares del vecto res: $contImp"
fi

