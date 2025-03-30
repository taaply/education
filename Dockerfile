FROM serversideup/php:8.3-fpm-nginx

ENV PHP_OPCACHE_ENABLE=1

USER root

# Install Node.js
# RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
#     && apt-get update \
#     && apt-get install -y nodejs \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable required PHP extensions
RUN docker-php-ext-install gd

# Copy application files
COPY --chown=www-data:www-data . /var/www/html

# # Switch to non-root user
# USER www-data

# Install dependencies and build
# RUN npm ci \
#     && npm run build \
#     && rm -rf /var/www/html/.npm

# Install PHP dependencies
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Remove composer cache
RUN rm -rf /var/www/html/.composer/cache

# Switch to non-root user
USER www-data