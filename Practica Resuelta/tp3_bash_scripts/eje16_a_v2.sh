#!/bin/bash

#Validacion de que se pase un solo parametro 
if ! [ $# -eq 1 ]; then
    echo "Error cant parametros pasados"
    exit 1
fi

#Encabezado para el archivo Reporte
echo -e "Nombre usuario    |   Cantidad de archivos con la extension: $1" > reporte.txt

#Iterara sobre cada linea
for linea_actual in $(cat /etc/passwd); do
    directorio_actual=$(cut -d: -f6 "$linea_actual")
    nombre_actual=$(cut -d: -f1 "$linea_actual")

    #Contar los archivos con la extension especifica "$1"
    cantidad_actual=$(find "$directorio_actual" -type f -name ".$1" -user $nombre_actual | wc -l)
    
    #Anhado info al reporte
    echo "$nombre_actual    |    $cantidad_actual" >> reporte.txt
done
