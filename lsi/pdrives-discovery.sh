#!/usr/bin/env bash

. $(dirname $(realpath $0))/.config
PDISKS=(`sudo $CMD -pdlist -aALL -NoLog | grep "Slot Number:" | awk '{print $3}'`)

[[ -z ${PDISKS[@]} ]] && exit 1

echo "{"
echo "	\"data\":["

for PD in ${PDISKS[@]}; do
    [[ $PD != ${PDISKS[-1]} ]] && COMMA=","
    echo "		{\"{#PD}\":\"$PD\"}$COMMA"
    unset COMMA
done

echo "	]"
echo "}"
