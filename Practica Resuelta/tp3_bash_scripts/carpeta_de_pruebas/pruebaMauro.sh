#!/bin/bash

if [ $# -ne 3 ]; then
    echo "error"
    echo $#
    exit 1    
fi

valor=$(echo "$1 $2 $3")

echo $valor
