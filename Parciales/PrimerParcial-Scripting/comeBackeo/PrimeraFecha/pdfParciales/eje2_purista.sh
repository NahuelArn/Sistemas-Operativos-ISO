#!/bin/bash

# Inicializa el arreglo con rutas completas de archivos .conf en /etc
vector=($(find /etc -type f -name "*.conf"))
    #sudo find "/etc" -type f -name "*conf"
# Función a: Imprime la cantidad de archivos en /etc con terminación .conf
cantidad() {
    echo "Cantidad de archivos .conf: ${#vector[@]}"
}

# Función b: Imprime solo los nombres de todos los archivos en /etc con terminación .conf
verArchivos() {
    echo "Archivos .conf en /etc:"
    for archivo in "${vector[@]}"; do
        echo "$(basename "$archivo")" #BASENAME GOODD
    done
}

# Función c: Verifica si un archivo con terminación .conf existe en /etc
existe() {
    local archivo_buscar="$1"
    for archivo in "${vector[@]}"; do
        if [[ "$(basename "$archivo")" == "$archivo_buscar" ]]; then
            echo "El archivo $archivo_buscar existe en /etc."
            return 0
        fi
    done
    echo "El archivo $archivo_buscar no existe en /etc."
    return 1
}

# Función d: Elimina lógicamente o físicamente un archivo .conf
eliminar() {
    if [ $# -ne 2 ]; then 
        echo "falta 1: nombreaArchivo, 2: logico/fisico"
        return 1
    fi
    if [[ "$2" = "logico" || "$2" = "fisico" ]]; then
        dimF=${#vector[@]}
        i=0
        encontrado="false"
        while [[ $i -lt $dimF && "$encontrado" = "false" ]]; do
            if [ $(basename "${vector[$i]}") = "$1" ]; then
                encontrado="true"
            else
                ((i++))
            fi
        done
        if [ "$encontrado" = "true" ]; then
            if [ "$2" = "fisico" ]; then
                echo "se va borrar fisico... entonces va ser un delet logico and fisico"
                rm "${vector[$i]}"
            else
                echo "se va borrar logico... enttonces solo va ser un delt en el vector"
            fi
            unset ${vector[$i]}
            vector=(${vector[@]})
        else
            echo "no se encontro ningun archivo con ese nombre"
            return 2
        fi
    else
        echo "no era ni logico ni fisico el segundo parametro"
        return 3
    fi
    return 0
}

# Ejemplo de cómo llamar a las funciones
# cantidad
 verArchivos
# existe "example.conf"
# eliminar "example.conf" "físico"
