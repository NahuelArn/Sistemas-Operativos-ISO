#!/bin/bash

# Verificar si se paso exactamente un parametro
if [ $# -ne 1 ]; then
    echo "Error: se esperaba 1 parámetro (nombre de usuario)"
    exit 1
fi

# Verificar si el usuario existe en el sistema
if grep -q "^$1:" /etc/passwd; then
    echo "El usuario $1 existe en el sistema"
    cont=0
    sigo="true"

    # Bucle para verificar si el usuario está logueado
    while [ "$sigo" = "true" ]; do
        if who | grep -q "^$1 "; then
            #La mejor ubicacion apropada vendria a ser /var/log que se guardan registros de logueo
            echo "Usuario: $1 detectado el: $(date)" >> /var/log/access_"$1".log
            ((cont++))
            if [ $cont -gt 29 ]; then
                sigo="false"  # Salir del bucle despues de 30 detecciones
            fi
        else
            echo "Esperando para detectar al usuario $1..."
        fi
        sleep 30  # Pausa de 30 segundos entre cada verificación
    done
    exit 0  # Finaliza con exito despues de 30 detecciones
    #Puede pasar que nunca se loguee el usuario y quedar en loop.. pero creo q esta bien q pueda pasar eso
else
    echo "Error: el usuario $1 no existe en el sistema"
    exit 1
fi

