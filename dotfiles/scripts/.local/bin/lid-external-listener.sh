#!/bin/bash

# Corre en tu sesión de usuario
acpi_listen | while read line; do
    if echo "$line" | grep -q -E "LID|VIDEOOUT"; then
		echo $line
        ./lid-external.sh
    fi
done

