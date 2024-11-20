#!/bin/bash

if [ $# -ne 3 ]; then
    echo "se esperaban 3 parametros, num1, num2, operando"
fi

case $3 in
    "+")
        echo "suma: $(($1 + $2))"
        ;;
    "-")
        echo "resta: $(($1 - $2))"
        ;;
    "/")
        echo "division: $(($1 / $2))"
        ;;
    "*")
        echo "multiplcacion: $(($1 * $2))"
        ;;
    *)
        echo "error";  exit 1
        ;;
esac
