#!/bin/bash

#Pide 2 numeros al usuario
echo "Ingrese 2 numeros: "
read num1 num2
#read -p "Ingrese un nombre: " nombre   ## de esta forma se pide en la misma linea la entrada

#Realizar operaciones aritmeticas
echo "Resultado de la suma: $(($num1 + $num2))" 
echo "Resultado de la resta: $(($num1 - $num2))"
echo "Resultado de la multiplicacion: $(($num1 * $num2))"
echo "Resultado de la division: $(($num1 / $num2))"

#Comparacion, para saber cual numero es el mayor
if [ $(($num1 > $num2)) ]; then
#if [ $num1 -gt $num2 ]; then #tambien se puede usar esta opcion
    echo "El numero: $num1 es mayor que $num2"
else
    echo "El numero: $num2 es mayor que $(num1)"
fi


