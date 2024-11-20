#!/bin/bash

vector=($(find "/etc" -type f -name "*conf" -exec basename {} \;))

cantidad(){
    echo "${#vector[@]}"
    #como no hay caso fallido.. automaticamente el script retorna 0
}

verArchivo(){
    #como no te dice una impresion especifica, podes mostrar todo el vector de una
    echo "${vector[@]}"
}

existe(){
    if [ $# -ne 1 ]; then
        echo "error cant parametros pasados menor"
        return 1 # va ser mi codigo de error.. el que utilice la funcion va tener q verificar el retorno y si es 1 tiene que meter un exit (1-255)
    fi

    if echo "${vector[@]}" | grep -qw "$1"; then
        echo "existe"
    else
        echo "no existe"
    fi
}

eliminar(){
    
}
