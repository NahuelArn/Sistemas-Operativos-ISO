#!/bin/bash
i=0
cumple="false"
vector=($(cat /etc/passwd | cut -d : -f6))
dimF=${#vector[@]}
while [[ $i -lt $dimF && "$cumple" = "false" ]]; do
    if find "${vector[$i]}" -type f -name &> /dev/null; then
        cumple="true"
    else
        ((i++))
    fi
done

if [ "$cumple" = "true" ]; then
    exit 0
else
    exit 1
fi
