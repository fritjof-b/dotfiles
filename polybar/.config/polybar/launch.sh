#!/usr/bin/env bash

# Kill running bars
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar1.log
polybar top >>/tmp/polybar1.log 2>&1 &

echo "Bar launched..."

