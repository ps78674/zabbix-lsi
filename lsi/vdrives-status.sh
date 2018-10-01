#!/usr/bin/env bash

[[ -z $1 ]] && echo "Virtual drive ID not specified." && exit 1

. $(dirname $(realpath $0))/.config
sudo $CMD -ldinfo -lALL -aALL -NoLog | sed -n "/Virtual Drive: $1/,/Is VD Cached:/p" | grep "State" | grep -q "Optimal" && echo 1 || echo 0
