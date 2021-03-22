FROM php:7.4-fpm

MAINTAINER andrew.dulev.mmo@gmail.com

#remove  composer.json.lock

# Set TERM to suppress warning messages.
ENV TERM=xterm-256color
ENV EXT_REDIS_VERSION=4.3.0 EXT_IGBINARY_VERSION=3.0.1

# php-xdebug version
ENV XDEBUG_VERSION 2_4_0RC4

# Install additional packages
RUN apt-get update && apt-get install -y git mc vim cron gnupg openssh-client unzip wget curl build-essential tar --no-install-recommends

# Install PHP extensions

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
         libpq-dev \
         libmcrypt-dev \
         libbz2-dev \
         libxslt-dev \
         libcurl4-openssl-dev \
         libmemcached-dev \
         zlib1g-dev \
         libncurses5-dev \
         libc-client-dev \
         libkrb5-dev \
         libpspell-dev \
         libtidy-dev \
         libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# RUN buildDeps=" \
#         libicu-dev \
#         libpq-dev \
#         libmcrypt-dev \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libbz2-dev \
#         libxslt-dev \
#         libcurl4-openssl-dev \
#         libmemcached-dev \
#         zlib1g-dev \
#         libncurses5-dev \
#         libc-client-dev \
#         libkrb5-dev \
#         libpspell-dev \
#         libtidy-dev \
#         libxml2-dev \
#     " \
#     && apt-get install -y $buildDeps --no-install-recommends \
#     && rm -r /var/lib/apt/lists/* \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
#     && docker-php-ext-install \
#       gettext \
#       exif \
#       curl \
#       calendar \
#       intl \
#       mbstring \
#       mcrypt \
#       pcntl \
#       pdo_mysql \
#       pdo_pgsql \
#       pgsql \
#       zip \
#       opcache \
#       iconv \
#       mcrypt \
#       gd \
#       bcmath \
#       bz2 \
#       xsl \
#       xmlrpc \
#       mysqli \
#       pspell \
#       shmop \
#       sockets \
#       sysvmsg \
#       sysvsem \
#       sysvshm \
#       tidy \
#       ftp\
#       fileinfo\
#       json\
#       xmlwriter\
#       xsl\
#       zip


RUN docker-php-source extract \
      gettext \
      exif \
      curl \
      calendar \
      intl \
      mbstring \
      mcrypt \
      pcntl \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      zip \
      opcache \
      iconv \
      mcrypt \
      gd \
      bcmath \
      bz2 \
      xsl \
      xmlrpc \
      mysqli \
      pspell \
      shmop \
      sockets \
      sysvmsg \
      sysvsem \
      sysvshm \
      tidy \
      ftp\
      fileinfo\
      json\
      xmlwriter\
      xsl\
      zip\
    && docker-php-source delete

RUN apt-get update && \
    pecl channel-update pecl.php.net && \
    pecl install apcu igbinary mongodb && \
    # compile Redis with igbinary support
    pecl bundle redis && cd redis && phpize && ./configure --enable-redis-igbinary && make && make install && \
    docker-php-ext-install bcmath sockets && \
    docker-php-ext-enable apcu igbinary mongodb opcache redis && \
    docker-php-source delete && \
    rm -r /tmp/* /var/cache/* /var/www/html/*
#
#RUN pecl install redis  \
#    && docker-php-ext-enable redis

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

#RUN pecl install imagick  \
#    && docker-php-ext-enable imagick


## Install php-xdebug
#RUN cd /usr/src/php/ext \
#    && curl -fsSL https://github.com/xdebug/xdebug/archive/XDEBUG_$XDEBUG_VERSION.tar.gz -o xdebug.tar.gz \
#    && mkdir -p xdebug \
#    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
#    && rm xdebug.tar.gz \
#    && docker-php-ext-configure xdebug --enable-xdebug \
#    && docker-php-ext-install xdebug


# Install php-wddx deprecated fro php 7.4 
# RUN docker-php-ext-configure wddx --enable-libxml \
#     && docker-php-ext-install wddx


# Install phpunit and put binary into $PATH
RUN curl -sSo phpunit.phar https://phar.phpunit.de/phpunit.phar \
    && chmod 755 phpunit.phar \
    && mv phpunit.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/phpunit.phar /usr/local/bin/phpunit

# RUN  sh -c "printf \"#!/bin/sh  export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin  docker run -v $(pwd):/app --rm phpunit/phpunit run \\\$@  \" > /usr/local/bin/phpunit" \
#     &&  chmod +x /usr/local/bin/phpunit


# Disable xdebug for composer
#RUN sed -i "s/zend_extension=/#zend_extension=/g" /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# install php vendors will be done manually

# Install Node.js/bower/gulp/grunt
RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash -
RUN apt-get install -y  nodejs

# install phantomjs
#RUN  curl -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
# RUN  curl -fsSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -o  phantomjs-2.1.1-linux-x86_64.tar.bz2 \
#     && tar xvf phantomjs-2.1.1-linux-x86_64.tar.bz2  \
#     && cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \
#     && phantomjs -v \
#     && apt-get install fontconfig

RUN echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;

# Clean system
RUN apt-get purge -y $buildDeps \
    && apt-get autoremove -y \
    && rm -rf /tmp/* /var/tmp/* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install Mozeo folders

COPY ./install.sh /
RUN chmod +x /install.sh

#ENTRYPOINT ["/install.sh"]
#CMD ["true", "batman", "superman"]

#setup envinronment file
COPY ./environment.sh /
RUN chmod +x /environment.sh

# Clear cache
COPY ./clear_cache.sh /
RUN chmod +x /clear_cache.sh

#CMD ["php7.0-fpm"]
