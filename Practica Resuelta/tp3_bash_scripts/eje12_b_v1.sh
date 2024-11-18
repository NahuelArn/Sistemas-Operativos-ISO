#!/bin/bash

#Creo una funcion para recibir 2 numeros, por parametro
#la funcion hace operaciones aritmeticas
comparaciones() {
    #Primer if, verifica que le hayan pasado 2 parametros
    if (($# == 2 )); then
        #Realiza operaciones aritmeticas
        echo "Resultado de la suma: $(($1 + $2))"
        echo "Resultado de la resta: $(($1 + $2))"
        echo "Resultado de la multiplicacion: $(($1 * $2))"
        echo "Resultado de la division: $(($1 / $2))"
    
        #Realiza una comparacion
        if [ $1 -gt $2 ]; then
            echo "El numero: $1 es mayor que $2 "
        else
            echo "El numero $2 es mayor que $1 "
        fi 
    else
        exit 1
    fi
}
#Pide 2 numeros al usuario
echo "Ingrese 2 numeros: "
read num1 num2
#Hago el llamado a la funcion con 2 argumentos
comparaciones $num1 $num2
