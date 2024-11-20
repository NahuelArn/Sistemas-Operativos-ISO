#!/bin/bash

if [ $# -ne 2 ]; then
    echo "no se recibieron 2 parametros"
    exit 1
fi

echo "la multiplicacion es: $(( $1 * $2 ))"
echo "la suma es: $(( $1 + $2 ))"
echo "la resta es: $(( $1 - $2 ))"
echo -e "los parametros son $* \n"
if [ $1 -lt $2 ]; then
    echo "el mayor es $2"
else
    echo "el mayor es $1"
fi
exit 0
