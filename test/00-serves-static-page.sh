#!/bin/bash
set -eux

cd "$(dirname $0)"

docker-compose up -d --build
trap "docker-compose stop -t 0; docker-compose rm -f -s -v" EXIT

body=$(curl -q "http://localhost:16001/")

test "$body" == "<html><body><p>Test</p></body></html>" || exit 1
