#!/usr/bin/env bash

[[ -z $1 ]] && echo "Physical disk slot number not specified." && exit 1

sudo /opt/MegaRAID/storcli/storcli64 -pdlist -a0 -NoLog | sed -n "/Slot Number: $1/,/Drive has flagged/p" | grep "Firmware state" | grep -q "Online" && echo 1 || echo 0
