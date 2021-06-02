#!/bin/sh
set -e

if [ ! -f composer.json ]; then
  ENV=$(cat .env)

  if [ "$CUSTOM_REPOSITORY" != "" ]; then
    git clone $CUSTOM_REPOSITORY tmp
    rm -rf tmp/.git
  else
    VERSION=""

    if [ "$SYMFONY_VERSION" != "" ]; then
      VERSION="--version=$SYMFONY_VERSION"
    fi

    symfony new tmp --full --no-git $VERSION
  fi

  jq '.extra.symfony.docker=true' tmp/composer.json >tmp/composer.tmp.json
  rm tmp/composer.json
  mv tmp/composer.tmp.json tmp/composer.json

  cp -Rp tmp/. .
  rm -Rf tmp/

  touch .env.local
  echo "$ENV" >.env.local

  if [ "$CUSTOM_REPOSITORY" = "" ]; then
    sed -i 's/DATABASE_URL="postgresql/# DATABASE_URL="postgresql/' .env
  fi

elif [ "$APP_ENV" != 'prod' ]; then
  rm -f .env.local.php
  composer install --prefer-dist --no-progress --no-interaction -q
fi

exec docker-php-entrypoint "$@"
