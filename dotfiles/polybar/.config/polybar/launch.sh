#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Espera a que terminen de cerrarse
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza una barra por cada monitor conectado
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar --reload toph &
done

echo "Bars launched..."
