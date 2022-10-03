#!/bin/bash
set -eux

cd "$(dirname $0)"

docker-compose up -d --build
trap "docker-compose stop -t 0; docker-compose rm -f -s -v" EXIT

# Default status line -> 503 Service Unavailable
status_line=$(curl -I "http://localhost:16001/" | head -n 1 | tr -d '\r\n')
test "$status_line" == "HTTP/1.0 503 Service Unavailable"

# Default body -> empty
body=$(curl -q "http://localhost:16001/")
test "$body" == "" || exit 1