#!/bin/bash

echo "Selecciona una opción:"
echo "SEE SELECCIONA CON EL NUMERO, PONE EL NUMERO, EL NUMERO NUMERO NUMERO DE OPCION"
select option in $(ls) "salir" "pepe"; do
    case $option in
        "salir")
            echo "saliendo..."
            exit 0
            ;;
        "pepe")
            echo "Pepe"
            ;;
        *)
            bash $option
            ;;
    esac
done
