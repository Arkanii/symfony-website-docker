#!/bin/bash
set -e
set -o allexport

if [ -f .env.local ]; then
  source ./.env.local
elif [ -f .env ]; then
  source ./.env
else
  echo "No .env or .env.local found !"
  exit
fi

declare USER_ID
# shellcheck disable=SC2034
USER_ID=$(id -u)

declare GROUP_ID
# shellcheck disable=SC2034
GROUP_ID=$(id -u)

options=""

while [[ "$#" -gt 0 ]]; do
  options="$options $1"
  shift
done

docker-compose up ${options}

set +o allexport
