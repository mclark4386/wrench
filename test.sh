#!/bin/bash
set -e
clear

verbose=""

echo $@

if [[ "$@" == "-v" ]]
then
  verbose="-v"
fi

docker-compose up -d
sleep 4 # Ensure backends are online

function test {
  echo "!!! Testing $1"
  go test -tags $1 $verbose $(go list ./... | grep -v /vendor/)
}

test "redis"

docker-compose down
