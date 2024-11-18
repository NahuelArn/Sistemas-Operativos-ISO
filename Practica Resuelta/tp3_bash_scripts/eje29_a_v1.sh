#Implemente un script que gregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:
#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
#encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5
#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
#borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
#usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
#validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10

#!/bin/bash

#vector=()

#for i in /home/*.txt; do
#    if [[ -f "$i" ]]; then
#        vector+=("$i")
#    fi
#done

direccion="/home/"
vector=("$direccion"*.doc)

#vector=($(ls "/home/" | grep "*.doc")) #no es buena esta solucion, si tengo algo hola.txtcasa te lo toma igual... no deberia

verla(){
    if [ $# -ne 1 ]; then
        echo "no se recibio el nombre del archivo a buscar"
        exit 3
    fi

    i=0
    dimF=${#vector[@]}
    sigo="true"
    while [[ $i -lt $dimF && "$sigo" == "true" ]]; do
        if [[ ${vector[i]} == "$1" ]]; then
            sigo="false"
        fi
        i=$((i+1))
    done
    if [ "$sigo" == "false" ]; then
        echo "el nombre del archivo: $1 se encuentra en el vector"
        return 0
    else
        echo "Archivo no encontrado"
        return 5
    fi
}

cantidad(){
    echo "la cantidad de archivos en /home con .doc es: ${#vector[@]}"
}

#helper
borrar_en_vector(){
    if [ $# -ne 1 ]; then
        exit 1
    fi
    dimF=${#vector[@]}
    sigo="true"
    i=0;
    while [[  $i -lt $dimF && "$sigo" == "true" ]]; do
        if [ "$1" ==  "${vector[$i]}" ]; then
            sigo="false"
        else
            i=$((i+1))
        fi
    done
    if [ "$sigo" == "false" ]; then
        unset vector[$i]
    fi
}

borrar(){
    if [ $# -eq 1 ]; then
        verla $1
        if [ $? -eq 0 ]; then #si verla retorno un 0, signfica que el arch existe en el vector
            echo "Desea borrar el archivo $1 LOGICAMENTE? INGRESE "SI" "
            echo "Desea borrar el archivo $1 FISICAMENTE? INGRESE "NO" "
            read opcion
            if [[ "$opcion" == "NO" || "$opcion" == "SI" ]]; then
                if [ "$opcion" == "NO" ]; then
                    #$(sudo rmdir $1) si la carpeta tiene contenido no sirve este comando
                    #$(sudo rm -rf $1) no necesito capturar la salida, va sin $()
                    sudo rm -rf "$1"
                fi
                borrar_en_vector "$1"
            fi
        else
            echo "archivo no encontrado"
            return 10
        fi
    else
        echo "no se recibio el nombre del archivo ha borrar"
        exit 3
    fi
}

select opcion in "verArchivo" "cantidadArchivos" "borrarArchivo" "fin"; do
    case $opcion in 
        "verArchivo")
            echo "Ingrese el nombre del archivo para buscarlo en el arreglo"
            read nombre
            verla $nombre
            ;;
        "cantidadArchivos")
            cantidad
            ;;
        "borrarArchivo")
            echo "ingrese un nomgre de archivo para borrar"
            read nombre
            borrar $nombre
            ;;
        "fin")
            echo "finalizando..."
            sleep 2
            exit 0
        *)
            echo "error flaquito"
            ;;
    esac
done
