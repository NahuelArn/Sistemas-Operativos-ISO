#!/bin/bash
echo "Ingrese una opcion"

select opcion in "Listar" "Donde Estoy" "Quien Esta" "Salir"
do    
    case $opcion in 
        "Listar")
            ls
            ;;
        "Donde Estoy")
            pwd
            ;;
        "Quien Esta")
            whoami
            ;;
        "Salir")
            break
            exit 0
            ;;
        *)
            echo "Opcion incorrecta, vuelva a intengar"
            exit 1
            ;;
    esac
done

