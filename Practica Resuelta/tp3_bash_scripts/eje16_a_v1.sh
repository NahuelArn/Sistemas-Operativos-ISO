#!/bin/bash
#Verifico que me pasen 1 argumento
if ! [ $# -eq 1 ]; then
    echo "No se paso la cantidad de parametros"
fi
#Me guardo el nombre de la extension en una variable (extension= ejem.txt ejem.jpg)
NOMBRE_EXTENSION=$s1
ESTRUCTURA="NOMBRE DE USUARIO   |   CANTIDAD DE ARCHIVOS CON LA EXTENSION: $1\n"

CONT=0
#Indico q quiero cortar/delimitar...
# indico que el delimitador va ser :
# q tome la primer columna y la ruta donde se va ejecutar cut va ser /etc/password
USUARIOS=$(cut -d: -f1 /etc/password)
for archivo in $USUARIOS; do
    nombre=$(cut -d: -f1)
    directorio=$(cut -d: -f6 /etc/password)
    cantidad=$(find $directorio -type -name ".$1" -user $nombre | wc -l)
    echo "nombre: $nombre cantidad: $cantidad" >> ESTRUCTURA
done

mkdir reporte.txt

echo "$(whoami)    |    $CONT" > reporte.txt
#exp
#https://geekland.eu/uso-del-comando-cut-en-linux-y-unix-con-ejemplos/
