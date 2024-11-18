#!/bin/bash
echo "Seleccione una opcion"
select opcion in "Ver archivos" "Mostrar fecha" "Salir" "Limpiar Consola"
do
	case $opcion in 
	    "Ver archivos")
			echo "Mostrando archivos del directorio actual"
			ls
			;;
		"Mostrar fecha")
			echo "La fecha y hora actuales son: "
			date
			;;
		"Salir")
			echo "saliendo del script"
			break
			;;
        "Limpiar Consola")
            clear 
            ;;
		*)
			echo "Opcion invalida. Intentalo de nuevo"
			;;
	esac
done
