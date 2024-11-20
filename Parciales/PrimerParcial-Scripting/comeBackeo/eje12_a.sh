#!/bin/bash

echo -n "Ingrese 2 numeros "; #el -n me evita el salto de linea
read num1 num2

echo "multiplicacion: $(( $num1 * $num2 ))"
echo "suma: $(( $num1 + $num2 ))"
echo "resta: $(( $num1 - $num2 ))"

if [ $num1 -gt $num2 ]; then
    echo "el numero $num1 es mas grande que el $num2"
else
    echo "el numero $num2 es mas grande que el $num1"
fi
