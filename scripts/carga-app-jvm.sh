#!/bin/bash

# URL de la API
API_URL="https://quarkus-duoc-jvm-jsalvobr-dev.apps.sandbox-m3.1530.p1.openshiftapps.com/hello"


# Número de solicitudes por segundo
RPS=10

# Tiempo entre lotes de solicitudes
INTERVAL=$(awk "BEGIN {print 1 / $RPS}")

# Mensaje para detener el script
echo "Presiona Ctrl+C para detener el script."

# Bucle infinito
while true; do
  # Ejecutar solicitudes en paralelo limitadas a RPS
  curl -ks -X GET "$API_URL"

  # Esperar antes del proximo lote
  sleep $INTERVAL
done
