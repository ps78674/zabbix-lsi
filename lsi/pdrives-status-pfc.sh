#!/usr/bin/env bash

[[ -z $1 ]] && echo "Physical disk slot number not specified." && exit 1

. $(dirname $(realpath $0))/.config
sudo $CMD -pdlist -a0 -NoLog | sed -n "/Slot Number: $1/,/Drive has flagged/p" | grep "Predictive Failure Count:" | awk '{print $4}' | xargs printf %d
