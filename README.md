# Symfony Website Docker

I learned Docker with [this](https://github.com/dunglas/symfony-docker) repo and I'll try to implement my own logic in this one.

All your Symfony development environment in **HTTPS** with only 1 command ! :sunglasses: :exploding_head: 

## Getting Started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/)
2. Copy `.env.sample` to `.env` and complete the information
3. Run `docker-compose up -d`, it will create the [Symfony website skeleton](https://github.com/symfony/website-skeleton) automatically for you (it can take 1 or 2 minutes)
4. Open [https://localhost](https://localhost) in your favorite web browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334)
5. Let's code your Symfony website ! :tada: :man_technologist: :woman_technologist:

## Whats's inside ? :monocle_face:

- Caddy : https://caddyserver.com/v2
- PHP-FPM
- MariaDB 
- phpMyAdmin : Open `https://localhost:8888` (By default) to access it (Do not forget to change credentials into .env)

## Credits

Created by Théo Frison, inspired and taken for some parts from https://github.com/dunglas/symfony-docker.
