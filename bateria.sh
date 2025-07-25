#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export XDG_RUNTIME_DIR="/run/user/1000"

#Obtener nombre dispositivo bateria
NOMBRE=$(upower -e | grep BAT)
#Extraer porcentaje actual de bateria
PORCENTAJE=$(upower -i "$NOMBRE" | grep -E "percentage" | awk '{print $2}' | tr -d '%')

#Chequea que este en estado de carga
STATE=$(upower -i "$NOMBRE" | grep -E "state" | awk '{print $2}')

#Si se esta cargando y ademas la bateria es mayor o igual a 78 -> envia notificacion
if [ "$STATE" = "charging" ] && [ "$PORCENTAJE" -ge 78 ] ; then
    notify-send -u critical "🔋 Bateria al $PORCENTAJE%" "Desconecta el cargador para preservar la vida util de tu dispositivo."
    canberra-gtk-play -i battery-low -d "BateriaLlena" &
fi