#!/bin/sh
set -e

if [ ! -f composer.json ]; then
  ENV=$(cat .env)

  if [ "$CUSTOM_REPOSITORY" != "" ]; then
    ISGIT=$(echo "git@github.com:Arkanii/arkanii.fr.git" | head -c4)

    if [ "$ISGIT" = "git@" ]; then
      SSHKEYHOST=$(echo "${CUSTOM_REPOSITORY}" | sed 's/.*@\(.*\):.*/\1/' );
      touch /root/.ssh/known_hosts
      ssh-keyscan $SSHKEYHOST >> /root/.ssh/known_hosts
      cat /root/.ssh/known_hosts
    fi

    git clone $CUSTOM_REPOSITORY tmp

    if [ "$CUSTOM_REPOSITORY_WITH_GIT_DIR" != "1" ]; then
      rm -rf tmp/.git
    fi
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

  touch .env.local
  echo "$ENV" >.env.local

  cp -Rp tmp/. .
  rm -Rf tmp/

  if [ "$CUSTOM_REPOSITORY" = "" ]; then
    sed -i 's/DATABASE_URL="postgresql/# DATABASE_URL="postgresql/' .env
  else
    if [ -f composer.json ]; then
      symfony composer install --no-progress --no-interaction -q
    fi

    if [ -f package.json ]; then
      if [ -f yarn.lock ]; then
        yarn install --silent
      elif [ -f package-lock.json ]; then
        npm install --silent
      fi
    fi

    symfony console d:s:u -f
  fi

elif [ "$APP_ENV" != 'prod' ]; then
  rm -f .env.local.php
  symfony composer install --prefer-dist --no-progress --no-interaction -q
fi

exec docker-php-entrypoint "$@"
