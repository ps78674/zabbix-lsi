#!/usr/bin/env bash

VDISKS=(`sudo /opt/MegaRAID/storcli/storcli64 -ldinfo -lALL -aALL -NoLog | grep "Virtual Drive:" | awk '{print $3}'`)

[[ -z ${VDISKS[@]} ]] && exit 1

echo "{"
echo "	\"data\":["

for VD in ${VDISKS[@]}; do
#    [[ $VD != ${VDISKS[@]:(-1)} ]] && COMMA="," # Bash pre-4.2
    [[ $VD != ${VDISKS[-1]} ]] && COMMA=","
    echo "		{\"{#VD}\":\"$VD\"}$COMMA"
    unset COMMA
done

echo "	]"
echo "}"
