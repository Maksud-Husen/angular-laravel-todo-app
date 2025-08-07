FROM php:7.1-fpm

# Set correct working directory (Laravel root)
WORKDIR  /var/www/html/todo

# Install system dependencies
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
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

COPY . .

# Run PHP required commands
RUN composer config --no-plugins allow-plugins.kylekatarnls/update-helper true && \
    composer install && \
    cp .env.example .env && \
    chmod 644 .env

RUN chmod -R 775 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache
# RUN php artisan migrate
RUN php artisan config:clear && \
    php artisan cache:clear && \
    php artisan route:clear && \
    php artisan view:clear 


EXPOSE 9000

CMD ["php-fpm"]