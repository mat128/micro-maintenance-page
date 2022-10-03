#!/bin/sh
LISTEN_PORT=${LISTEN_PORT:-8080}
RESPONSE_CODE=${RESPONSE_CODE:-"503 Service Unavailable"}

while true; do {
  echo -e "HTTP/1.0 ${RESPONSE_CODE}\r\n"
  echo "${CONTENT_BODY}"
} | nc -p "${LISTEN_PORT}" -l; done