#!/usr/bin/env bash

. $(dirname $(realpath $0))/.config
VDISKS=(`sudo $CMD -ldinfo -lALL -aALL -NoLog | grep "Virtual Drive:" | awk '{print $3}'`)

[[ -z ${VDISKS[@]} ]] && exit 1

echo "{"
echo "	\"data\":["

for VD in ${VDISKS[@]}; do
    [[ $VD != ${VDISKS[-1]} ]] && COMMA=","
    echo "		{\"{#VD}\":\"$VD\"}$COMMA"
    unset COMMA
done

echo "	]"
echo "}"
