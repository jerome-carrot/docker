
FROM php:5-apache
MAINTAINER Zérôme <jerome.carrot@gmail.com>

# Add custom php.ini
COPY php.ini /usr/local/etc/php/

# Install PHP extensions
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y libxml2-dev libmcrypt-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) pdo_mysql mcrypt soap gd

# Set apache configuration
RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*
ADD vhost-magento.conf /etc/apache2/sites-available/
RUN a2enmod rewrite
RUN a2ensite vhost-magento.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

