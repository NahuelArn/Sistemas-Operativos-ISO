#!/bin/bash
if [[ $# -lt 3 || $# -gt 4 ]]; then
    echo "Error en la cantidad de parametros"
    exit 1
fi


funcionA(){
	if [ $# -ne 1 ]; then
		echo "Error en la cantidad de parametros"
		return 1
	fi
	if [ ! -d "$1"]; then
		echo "Error en el primer parametro"
		return 1
	fi
	vector+=($(find "$1" -maxdepth 1 -type f))

	echo "contenido final del arreglo ${vector[@]}"
}

funcionB(){
	if [ $# -ne 1 ]; then
		echo "Error en la cantidad de parametros"
		return 1
	fi
	for i in ${vector[@]}; do
		terminacion=$(basename $i | cut -d '.' -f2)
		if [ "$terminacion" = "$1" ]; then
			unset vector[$i]
		fi
	fi
	vector=(${vector[@]})
	return 0
	#echo "contenido final del arreglo ${vector[@]}"
}


#main

if [ -d "$1" ]; then
	vector=($(find "$1" -maxdepth 1 -type f));
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
			funcionC
            rm "$1"*.gz
        #else    #se elimina solo del areglo  
        fi
        echo "me rompi por vacio"
        #en ambos casos elimino del arreglo
        funcionB
        ;;
    *)
        echo "el segundo parametro no es valido.. debe ser -a o -b"
        exit 4
        ;;
esac