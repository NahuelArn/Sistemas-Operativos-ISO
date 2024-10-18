#!/bin/bash
cont=0
for i in $(cat /etc/passwd); do #uso cat porque quiero imprimir todo el contenido del archivo
    directorio=$(echo "$i" | cut -d : -f6) #aca Quiero capturar la salida en una variable... uso echo porque solo quiero imprimir la variable
    nombre=$(echo "$i" | cut -d : -f1)
    if  [ -d "$directorio" ]; then #verifica que el directorio exista... no lo tengo que hacer con -z... estoy verificando directorios
        echo "nombre de usuario que tiene directorio personal: $nombre"
        ((cont++))
    fi
done

echo "cont es: $cont"
if [ $cont -eq 0 ]; then
    echo "No se encontro ningun directorio personal configurado"
    exit 1
else
    exit 0
fi
