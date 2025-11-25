FROM php:8.4-apache

# Arguments defined in docker-compose.yml
ARG user=dev
ARG uid=1000

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    libpng-dev \
    unzip \
    libzip-dev \
    libicu-dev \
    build-essential \
    g++ \
    zlib1g-dev \
    libpq-dev

# Install PHP extensions
RUN docker-php-ext-install gd zip intl pdo_pgsql pgsql && a2enmod rewrite

# Get latest Composer
COPY --from=composer:2.9.2 /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user
# Set working directory
WORKDIR /var/www/html
