#!/bin/bash

# Obtener fecha desde el sistema
fecha=$(cat /proc/driver/rtc 2>/dev/null | grep 'rtc_date' | awk '{print $3}')
hora=$(cat /proc/driver/rtc 2>/dev/null | grep 'rtc_time' | awk '{print $3}')

if [[ -z "$fecha" || -z "$hora" ]]; then
    # Alternativa usando timestamp si /proc/driver/rtc no está disponible
    timestamp=$(cat /proc/uptime | awk '{print $1}')
    hora_sistema=$(TZ=UTC date -d @"$(echo "$(date +%s) - ${timestamp%%.*}" | bc)" '+%Y-%m-%d %H:%M:%S')
    echo "🗓️ Fecha y hora estimada (UTC): $hora_sistema"
else
    echo "🗓️ Fecha actual: $fecha"
    echo "⏰ Hora actual:  $hora"
fi
