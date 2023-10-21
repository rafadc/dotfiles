#!/usr/bin/env bash

killall -q polybar
#polybar-msg cmd quit

#echo "---" | tee -a /var/log/polybar.log

polybar topbar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched"
