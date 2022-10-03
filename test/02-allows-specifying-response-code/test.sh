#!/bin/bash
set -eux

cd "$(dirname $0)"

docker-compose up -d --build
trap "docker-compose stop -t 0; docker-compose rm -f -s -v" EXIT

status_line=$(curl -I "http://localhost:16001/" | head -n 1 | tr -d '\r\n')

test "$status_line" == "HTTP/1.0 418 I'm a teapot"