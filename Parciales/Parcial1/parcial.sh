#!/bin/bash

#verifico que me pasen parametros, me pueden pasar N
if [ $# -eq 0 ]; then
    echo "no se paso ningun parametro"
    exit 1
fi

#funciones
esta_logueado(){
    if [ $# -eq 1 ]; then
        if who | grep -w "^$1" >> /dev/null; then
            return 0 # esta logueado
        else
            return 2 #no esta logueado
        fi
    else
        #echo "no se paso ningun parametro"
        return 1
    fi
}

cantPro=0
cant_procesos(){
    if [ $# -eq 1 ]; then
        #podria poner a cantPro aca e inicializar en 0, seria mejor
        cantPro=$(psu -u "$1" | wc -l)
        cantPro=$((cantPro - 1)) #el -1 es porque ps -u usuario.. me devuelve los procesos pero con un encabezado de los nombres de cada columna 
    fi
}
#aca me encargo de carga mi estructura de datos
dimF=$#

vector=()
for (( i=0; $i < $dimF; i++ )); do
    vector+=(${!i})
    #vector+=($i) #si lo haces asi, te va cargar el indice... vos queres los valores de los parametros
done

#el enunciado de este parcial.. es medio ambiguo.. se puede interpretar de muchas formas
select opcion in "esta logueado" "cant procesos" "uso de procesos"; do
    case "$opcion" in 
        "esta logueado")
            for i in ${vector[@]}; do
                esta_logueado $i
                if [ $? -eq 0 ]; then
                    echo "el ususario $1 esta logueado"
                fi
            done
            ;;
        "cant procesos")
            for i in ${vector[@]}; do
                cant_procesos $i 
                #me pide devolver voy a tener que usar una variable global
                echo "la cantidad de procesos qeu esta corriendo el usuario: $i es: $cantPro"
                cantPro=0
            done
            ;;
        "uso de procesos")
            for i in ${vector[@]}; do
                cant_procesos $1
                if [ $cantPro -gt 100 ]; then
                    echo "el usuario $i tiene mas de 100 procesos corriendo $(date)" >> /etc/log/usuario_procesos.txt
                fi
                cantPro=0
            done
            ;;
        *)
            echo "parametro no tan erroneo, es donde corta"
            exit 1
            ;;
    esac
done

