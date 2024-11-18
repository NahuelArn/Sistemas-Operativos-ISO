#!/bin/bash
# ruta dbd vector de carga
# -a o -d
# if -a ? rutaB:

if [[ $# -lt 3 || $# -gt 4 ]]; then #como max me ingresan 4 parametros y minimo 3
    echo "Se esperaban 3 o 4 parametros... Ruta, opcion, opcion 2"
    exit 1
fi


funcionA(){
    if [[ $# -eq 1 && -d "$1" ]]; then
        #vector+=($(ls -l | grep '^-'))
        vector+=($(ls "$1" -l | grep '^-' | cut -d ' ' -f9))
        return 0
    else
        echo "Faltaron parametros o la ruta no existia"
        return 5
    fi
}

#al pedo matarse, haciendo los corrimientos.. 
#borrar_en_vector(){
#    dimF=${#vector[@]}
#    i=0
#    echo "dimension fisica $dimf"
#    while [[ $i -lt $dimF ]]; do
#        aux=$(echo "${vector[i]}" | cut -d . -f2)
#        if [[ "$aux" == "gz" ]];then
#            unset ${vector[i]}
#            #dimF=${#vector[@]}
#        else
#            i=$((i+1))
#        fi
#    done  
#    echo "salgo de aca????"
#}

borrar_en_vector(){
    dimF=${#vector[@]}
    i=0
    while [[ $i -lt $dimF ]]; do
        if [[ "${vector[i]}" == *.gz ]]; then
            unset vector[i]  # Borrar el archivo con extensión .gz
        fi
        i=$((i+1))  # Incrementar el índice
    done

    # Reindexar el arreglo para eliminar huecos
    vector=("${vector[@]}")
}

#evaluo que la ruta que me pasen exista, sea un directorio
if [ -d "$1" ]; then    
    #vector=($(ls "$1" -l | grep '^-' )) #aca en bash, las variables son globales.. no me importa el lifetime... solo se aplica el lifetime en funciones 
    vector=($(ls "$1" -l | grep '^-' | cut -d ' ' -f9))
else
    echo "el directorio pasado no existe... primer parametro"
    exit 2
fi

case $2 in 
    "-a")
        funcionA $3
        if [ $? -eq 0 ]; then
            echo "contenido del vector: ${vector[@]}"
        else
            echo "ocurrio algun error en la funcion A"
            exit 1
        fi
        ;;
    "-d")
        echo "entre aca por -d"
        if [ "$4" == "-f" ]; then
            rm "$1"*.gz
        #else    #se elimina solo del areglo  
        fi
        echo "me rompi por vacio"
        #en ambos casos elimino del arreglo
        borrar_en_vector
        #for i in ${vector[@]}; do #problema de cadp, si eliminas el actual te va faltar verifar el actual por el nuevo corriemiento
        #    if [ $[]
        ;;
    *)
        echo "el segundo parametro no es valido.. debe ser -a o -b"
        exit 4
        ;;
esac
if [ "$2" != "-a" ]; then
    echo "contenido del arreglo: ${vector[@]}"
fi
exit 0
