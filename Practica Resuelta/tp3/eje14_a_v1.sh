#!/bin/bash

#Verifico que pasaron los 3 argumentos para que funcione el script
if [ $# -ne 3 ]; then #si la cant de argumentos no es 3 (entra)
    echo "No se pasaron los 3 parametros: Comando, Ruta, Nombre "
    exit 1
fi

#Hago las validaciones 
if [ -d "$2" ]; then #Si existe el directorio en la ruta proporcionada
    if [[ "$1" == "-a" || "$1" == "-b" ]]; then #Si hay operadores logicos va doble [[logica]]
        pushd "$2"    #Me posiciono en ese directorio y salvo mi ruta actual
        for i in $(ls); do
            if [ -f "$i" ]; then
                if [ "$1" == "-a" ]; then
                    mv "$i" "$i$3" #Concateno la CADENA al final
                elif [ "$1" == "-b" ]; then #Redundancia... si estoy aca ya se q es -b, es mejor un else
                    mv "$i" "$3$i" #Concateno la CADENA al principio
                 fi
             fi
        done
        popd #Recupero mi directorio donde estaba parado en un principio
        exit 0
    else
        echo "No se paso un comando valido (' -a ' o ' -a ')"
        exit 1 
    fi
else
    echo "No existe el directorio en la ruta proporcionada"
    exit 1
fi

