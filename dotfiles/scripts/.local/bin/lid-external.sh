#!/bin/bash

# -------------------------------
# Script inteligente de pantallas
# -------------------------------

LOGFILE="$HOME/lid-external-log.txt"

echo "===================" >> $LOGFILE
echo "$(date) - Ejecutando script" >> $LOGFILE

# Detectar pantalla interna (laptop)
INTERNAL=$(xrandr | grep " connected" | grep -E "eDP|LVDS" | awk '{print $1}')

# Detectar monitores externos
EXTERNALS=$(xrandr | grep " connected" | grep -v -E "eDP|LVDS" | awk '{print $1}')

# Estado de la tapa
LID_STATE=$(cat /proc/acpi/button/lid/*/state | awk '{print $2}')

echo "INTERNAL=$INTERNAL" >> $LOGFILE
echo "EXTERNALS=$EXTERNALS" >> $LOGFILE
echo "LID_STATE=$LID_STATE" >> $LOGFILE

# -------------------------------
# Aplicar configuración
# -------------------------------
if [ "$LID_STATE" = "closed" ] && [ -n "$EXTERNALS" ]; then
    echo "Tapa cerrada con monitor externo: activando solo externos" >> $LOGFILE
    sleep 0.05
	if [ -n "$INTERNAL" ]; then
		xrandr --output $INTERNAL --off
	fi
    sleep 0.05
    for ext in $EXTERNALS; do
        xrandr --output $ext --auto --primary
    done
else
    echo "Tapa abierta o sin monitor externo: activando interna y externos" >> $LOGFILE
    sleep 0.05
    if [ -n "$INTERNAL" ]; then
		xrandr --output $INTERNAL --auto --primary
	fi
    sleep 0.05
    if [ -n "$EXTERNALS" ]; then
        for ext in $EXTERNALS; do
            xrandr --output $ext --right-of $INTERNAL
        done
    fi
fi

echo "Script ejecutado correctamente" >> $LOGFILE

