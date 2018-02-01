#!/usr/bin/env bash

PDISKS=(`sudo /opt/MegaRAID/storcli/storcli64 -pdlist -aALL -NoLog | grep "Slot Number:" | awk '{print $3}'`)

[[ -z ${PDISKS[@]} ]] && exit 1

echo "{"
echo "	\"data\":["

for PD in ${PDISKS[@]}; do
#    [[ $PD != ${PDISKS[@]:(-1)} ]] && COMMA="," # Bash pre-4.2
    [[ $PD != ${PDISKS[-1]} ]] && COMMA=","
    echo "		{\"{#PD}\":\"$PD\"}$COMMA"
    unset COMMA
done

echo "	]"
echo "}"
