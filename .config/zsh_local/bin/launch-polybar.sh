#!/usr/bin/env zsh
#terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar example &

echo "Bars launched..."
