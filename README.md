# Symfony Website Docker

I learned Docker with [this](https://github.com/dunglas/symfony-docker) project, and I try to implement my own logic into this one.

All your Symfony development environment in **HTTPS** with only 1 command ! :sunglasses: :exploding_head: 

## Getting Started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/)
2. Copy `.env.sample` to `.env` and complete the information
3. Run `./run.sh -d` (or `./run.sh` to see all logs), it will create the [Symfony website skeleton](https://github.com/symfony/website-skeleton) automatically for you (it can take 1 or 2 minutes)
4. Open [https://localhost](https://localhost) in your favorite web browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334)
5. Let's code your Symfony website ! :tada: :man_technologist: :woman_technologist:
6. Open [https://localhost:8888](https://localhost:8888) to access to your phpMyAdmin

_(All those localhost links are valid if you let the .env by default.)_

## Whats's inside ? :monocle_face:

- [Caddy](https://caddyserver.com/v2)
- PHP-FPM
- MariaDB
- phpMyAdmin

## FAQ

### Why use a run.sh into this template ?

Symfony uses [the .env file](https://symfony.com/doc/current/configuration.html#config-dot-env).
Into their best practices, Symfony asks to [use environment variables](https://symfony.com/doc/current/best_practices.html#use-environment-variables-for-infrastructure-configuration)
for obvious security reasons so as not to commit environment variables or passwords.

However, Docker uses the .env file too, witch needs this file to get these secrets variables which are stored in .env.local file.
That's why I created a `run.sh` in order to grab this information and run them into Symfony and Docker at the same time.

This script is also used to avoid permissions issues between files that are on your computer, and those that are in the Docker service.

If anyone has a better idea to avoid this file, don't hesitate to open a ticket !

### Can I use [Symfony CLI](https://symfony.com/doc/current/setup/symfony_server.html) into my project when docker-compose is lunched ?

Of course, you can ! Just lunch `symfony serve` after `./run.sh -d` and open [https://127.0.0.1:8000](https://127.0.0.1:8000) (by default)

### My web browser block my custom port !

Check these links and look if your custom port is not reserved by your web browser.

- Restricted ports from Chrome : [here](https://chromium.googlesource.com/chromium/src.git/+/refs/heads/main/net/base/port_util.cc#68)
- Restricted ports from Mozilla : [here](https://www-archive.mozilla.org/projects/netlib/portbanning#portlist)

## Credits

Created by Théo Frison, inspired and taken for some parts from [this project](https://github.com/dunglas/symfony-docker).
