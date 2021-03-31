FROM php:7.3-fpm

RUN set -eux; \
    apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends \
            curl \
            libmemcached-dev \
            libz-dev \
            libpq-dev \
            libjpeg-dev \
            libpng-dev \
            libfreetype6-dev \
            libssl-dev \
            libwebp-dev \
            libmcrypt-dev; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \ 
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install pdo_pgsql; \
    docker-php-ext-configure gd \
            --with-jpeg-dir=/usr/lib \
            --with-webp-dir=/usr/lib \
            --with-freetype-dir=/usr/include/freetype2; \
    docker-php-ext-install gd; \
    php -r 'var_dump(gd_info());'

RUN set -xe; \
    apt-get update -yqq && \
    pecl channel-update pecl.php.net && \
    apt-get install -yqq \
      apt-utils \
      gnupg2 \
      git;

USER root

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update --preview
RUN command -v composer

###########################################################################
# Crontab
###########################################################################

USER root

COPY laravel/crontab/* /etc/cron.d

RUN chmod -R 644 /etc/cron.d

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y
RUN command -v node
RUN command -v npm

COPY laravel/laravel.ini /usr/local/etc/php/conf.d

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

    
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN groupmod -o -g ${PGID} www-data && \
    usermod -o -u ${PUID} -g www-data www-data

WORKDIR /apps

CMD ["php-fpm"]

EXPOSE 9000
