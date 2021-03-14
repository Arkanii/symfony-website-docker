#!/bin/sh
set -e

if [ ! -f composer.json ]; then
  ENV=$(cat .env)
  VERSION=""

  if [ "$SYMFONY_VERSION" != "" ]; then
    VERSION="--version=$SYMFONY_VERSION"
  fi

  symfony new tmp --full --no-git $VERSION
  jq '.extra.symfony.docker=true' tmp/composer.json >tmp/composer.tmp.json
  rm tmp/composer.json
  mv tmp/composer.tmp.json tmp/composer.json

  cp -Rp tmp/. .
  rm -Rf tmp/

  touch .env.local
  echo "$ENV" >.env.local

  sed -i 's/DATABASE_URL="postgresql/# DATABASE_URL="postgresql/' .env
  sed -i 's/- .env/- .env.local/' docker-compose.yaml

elif [ "$APP_ENV" != 'prod' ]; then
  rm -f .env.local.php
  composer install --prefer-dist --no-progress --no-interaction -q
fi

exec docker-php-entrypoint "$@"
