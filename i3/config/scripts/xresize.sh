#!/usr/bin/env bash

/usr/bin/spice-vdagent

xev -root -event randr | grep --line-buffered 'subtype XRROutputChangeNotifyEvent' | while read i; do
  xrandr | grep ' connected' | awk '{print $1}' | while read j; do
    xrandr --output $j --auto;
  done
  polybar-msg cmd restart 1>/dev/null 2>/dev/null;
done
