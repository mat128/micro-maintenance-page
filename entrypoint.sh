#!/bin/sh
LISTEN_PORT=${LISTEN_PORT:-8080}

mkdir -p /var/www/html
echo "${CONTENT_BODY}" > /var/www/html/index.html

echo "Serving static content on ${LISTEN_PORT}"
echo "------------- Content -------------"
cat /var/www/html/index.html
echo "-----------------------------------"

httpd -f -p "${LISTEN_PORT}" -h /var/www/html