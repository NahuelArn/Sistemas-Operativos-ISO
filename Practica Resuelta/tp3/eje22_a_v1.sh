#!/bin/bash

vector=(10 3 5 7 9 3 5 4)

multiplicar=1
for i in "${vector[@]}"; do
    multiplicar=$(($i * $multiplicar))
done

echo "total: $multiplicar"

