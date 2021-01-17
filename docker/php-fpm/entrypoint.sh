#!/bin/sh
set -e

if [ ! -f composer.json ]; then
  symfony new tmp --full --no-git
  jq '.extra.symfony.docker=true' tmp/composer.json >tmp/composer.tmp.json
  rm tmp/composer.json
  mv tmp/composer.tmp.json tmp/composer.json

  cp -Rp tmp/. .
  rm -Rf tmp/
elif [ "$APP_ENV" != 'prod' ]; then
  rm -f .env.local.php
  composer install --prefer-dist --no-progress --no-interaction -q
fi

exec docker-php-entrypoint "$@"