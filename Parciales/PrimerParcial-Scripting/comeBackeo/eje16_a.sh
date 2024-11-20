#!/bin/bash

if [ $# -ne 1 ]; then
    echo "faltan parametros"; exit 1
fi

echo "Nombre de usuario  | Cant de archivos $1" >> archivo_generado.txt

for i in $(cat /etc/passwd | cut -d : -f1,6); do
    cont=0
    directorio=$(echo "$i" | cut -d : -f2)
    usuario=$(echo "$i" | cut -d : -f1)
    if [ -d "$directorio" ]; then
        cont=$(find "$directorio" -type f -name "*.$1" | wc -l)
        echo -e "usuario : $usuario cantidad: $cont \n" >> archivo_generado.txt
    fi
done
exit 0
