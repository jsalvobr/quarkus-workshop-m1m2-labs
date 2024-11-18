#!/bin/bash

# URL de la API
API_URL="https://quarkus-duoc-native-jsalvobr-dev.apps.sandbox-m3.1530.p1.openshiftapps.com/hello"


# Número de solicitudes por segundo
RPS=10

# Tiempo entre lotes de solicitudes
INTERVAL=$(awk "BEGIN {print 1 / $RPS}")

# Función para realizar una solicitud
make_request() {
  # curl -s -X GET "$API_URL" > /dev/null
  curl -ks -X GET "$API_URL"
}

# Mensaje para detener el script
echo "Presiona Ctrl+C para detener el script."

# Bucle infinito
while true; do
  # Ejecutar solicitudes en paralelo limitadas a RPS
  seq 1 $RPS | xargs -n1 -P$RPS bash -c 'make_request'
  
  # Esperar antes del próximo lote
  sleep $INTERVAL
done
