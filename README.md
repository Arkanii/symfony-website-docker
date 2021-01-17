# Symfony Website Docker

I learned Docker with [this](https://github.com/dunglas/symfony-docker) repo and I'll try to implement my own logic in this one.

All your development environment in **HTTPS** with only 2 commands ! :sunglasses: :exploding_head: 

## Getting Started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/)
2. Run `docker-compose up -d`
3. If you are launching your project for the first time, run `docker-compose run --rm php-fpm chown -R $(id -u):$(id -g) .`
4. Open `https://localhost` in your favorite web browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334)
5. Let's code Symfony websites ! :tada:

## Whats's inside ? :monocle_face:

- Caddy : https://caddyserver.com/v2
- php-fpm
- mariaDB 
- phpMyAdmin : Open `https://localhost:8888` to access it ( User: root | No password ( for the moment :scream: ))

## Credits

Created by Théo Frison, inspired and taken in part from https://github.com/dunglas/symfony-docker.