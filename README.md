# Symfony Website Docker

I learned Docker with [this](https://github.com/dunglas/symfony-docker) repository, and I try to implement my own logic into this one.

All your Symfony development environment in **HTTPS** with only 1 command ! :sunglasses: :exploding_head: 

## Getting Started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/)
2. Copy `.env.sample` to `.env` and complete the information
3. Run `./run.sh -d`, it will create the [Symfony website skeleton](https://github.com/symfony/website-skeleton) automatically for you (it can take 1 or 2 minutes)
4. Open [https://localhost](https://localhost) in your favorite web browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334)
5. Let's code your Symfony website ! :tada: :man_technologist: :woman_technologist:
6. Open [https://localhost:8888](https://localhost:8888) to access to your phpMyAdmin

_(All those localhost links are valid if you let the .env by default.)_

## Whats's inside ? :monocle_face:

- Caddy : https://caddyserver.com/v2
- PHP-FPM
- MariaDB
- phpMyAdmin

## FAQ

### Why use a run.sh into this template ?

Symfony (security + .env.local), Docker .env

### Can I use Symfony CLI into my project when docker-compose is lunched ?

Dunno (need to test it) yes

## Credits

Created by Théo Frison, inspired and taken for some parts from https://github.com/dunglas/symfony-docker.
