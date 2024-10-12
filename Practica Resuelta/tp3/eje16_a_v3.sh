#!/bin/bash
   
#Validacion de que se pase un solo parametro 
if ! [ $# -eq 1 ]; then
    echo "Error cant parametros pasados"
    exit 1
fi
   
#Encabezado para el archivo Reporte
echo -e "Nombre usuario    |   Cantidad de archivos con la extension: $1" > reporte.txt

#Iterara sobre cada linea
#for linea_actual in $(cat /etc/passwd); do #CAT HACE COSAS RARAS
for linea_actual in $(cat /etc/passwd  | cut -d: -f1,6); do 
    #directorio_actual=$(cut -d: -f2 "$linea_actual")
    #nombre_actual=$(cut -d: -f1 "$linea_actual")
    directorio_actual=$(echo "$linea_actual" | cut -d: -f2)
    nombre_actual=$(echo "$linea_actual" | cut -d: -f1)
    if [ -d "$directorio_actual" ]; then
        #Contar los archivos con la extension especifica "$1"
        cantidad_actual=$(sudo find "$directorio_actual" -type f -name "*.$1" -user $nombre_actual | wc -l)
    else
        cantidad_actuak=0
    fi
    #Anhado info al reporte
    echo "$nombre_actual    |    $cantidad_actual" >> reporte.txt
done   
