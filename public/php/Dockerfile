FROM php:7.1-fpm

# Set correct working directory (Laravel root)
WORKDIR  /var/www/html/todo

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo pdo_mysql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ../../composer.json /var/www/html/todo/
COPY ../../composer.lock /var/www/html/todo/
COPY ../../../ /var/www/html/todo

# Install PHP dependencies
RUN composer config --no-plugins allow-plugins.kylekatarnls/update-helper true 

RUN  scp /var/www/html/todo/.env.example /var/www/html/todo/.env

RUN php artisan key:generate \
    && php artisan optimize \
    && chmod 644 .env \
    && composer install 

EXPOSE 9000

CMD ["php-fpm"]
