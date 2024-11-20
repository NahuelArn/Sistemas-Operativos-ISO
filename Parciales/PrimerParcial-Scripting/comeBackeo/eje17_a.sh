#!/bin/bash

echo -e "Nombres ANTES de los archivos \n";

for i in *; do
    if [ -f "$i" ]; then
        nombre=$(echo "$i" | cut -d . -f1 | tr "a-zA-Z" "A-Za-z" | tr -d "aA")
    fi
    echo -e "$nombre \n"
done


