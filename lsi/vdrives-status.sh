#!/usr/bin/env bash

[[ -z $1 ]] && echo "Virtual drive ID not specified." && exit 1

sudo /opt/MegaRAID/storcli/storcli64 -ldinfo -lALL -aALL -NoLog | sed -n "/Virtual Drive: $1/,/Is VD Cached:/p" | grep "State" | grep -q "Degraded" && echo 0 || echo 1
