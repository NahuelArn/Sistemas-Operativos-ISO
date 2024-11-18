#!/bin/bash

#me retorna todo archivo que empiece con csa
resultado=$(find $(pwd) -name "csa*")

#resultado=$(find /mnt/d/Escritorio/Sistemas-Operativos-ISO/Parciales/carpetaPruebas -name "csa*")
echo "el resultado es: $resultado"

echo -e "------------------------------\n"

#en este si o si tiene coincidicar que sea csa.txt, me devuelve todos las rutas q contengan este archivo
resultado=$(find $(pwd) -name "csa.txt")
echo -e "------------------------------\n"

#Me retorna la ruta de la carpeta, si la encuentra
resultado=$(find $(pwd) -name "carpeta" -type d)

echo "no deberia devolver nada $resultado"

#la ruta actual tiene la profundidad 1

#retorna las rutas de los directorios a una profundidad max 2
resultado=$(find $(pwd) -maxdepth 2 -type d -name "nombre_del_directorio")

#retorna las rutas de los archivos regulares a una profundidad max 2
resultado=$(find $(pwd) -maxdepth 2 -type f -name "csa.txt")


