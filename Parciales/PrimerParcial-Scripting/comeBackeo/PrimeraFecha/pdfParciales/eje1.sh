#!/bin/bash

#!/bin/bash

verificador() {
    cont=0
    while [ "$cont" -lt 10 ]; do
        if ps -aux | grep -qw '[a]pache'; then #con esto me aseguro que sea el proceso apache [a]pache
            #Pasaba que se autocontaba el grep "al tirar el if ese el grep tambien se convierte un proceso.. q tiene un campo llamado apache"
            ((cont++))
        fi
        sleep 5
    done

    echo "Terminó exitosamente"
    exit 50
}

verificador

