#!/bin/bash
git clone https://github.com/laravel/laravel.git
chmod -R 777 laravel/bootstrap && chmod -R 777 laravel/storage && cp laravel/.env.example laravel/.env
cp composer.json laravel/composer.json
mv laravel code
docker run -t --rm -v $(pwd)/code:/composer -w /composer composer/composer install
docker run -t --rm -v $(pwd)/code:/code -w /code  bitnami/php-fpm:7.2-prod php artisan key:generate
