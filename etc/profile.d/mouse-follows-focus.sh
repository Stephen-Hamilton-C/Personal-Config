#!/bin/sh

# I wrote this to let my cursor center itself in focused windows in i3.

MOVEMOUSE='eval `xdotool getactivewindow getwindowgeometry --shell`; xdotool mousemove $((X+WIDTH/2)) $((Y+HEIGHT/2))'
xdotool search . behave %@ focus exec sh -c "$MOVEMOUSE"
