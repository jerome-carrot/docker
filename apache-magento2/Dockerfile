
FROM php:7-apache
MAINTAINER Zérôme <jerome.carrot@gmail.com>

# Add custom php.ini
COPY php.ini /usr/local/etc/php/

# Install PHP extensions
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libxml2-dev \
    libxslt-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd intl mcrypt pdo_mysql soap xsl zip

# Set apache configuration
RUN rm /etc/apache2/apache2.conf
ADD apache2.conf /etc/apache2/
RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*
ADD vhost-magento.conf /etc/apache2/sites-available/
RUN a2enmod rewrite
RUN a2ensite vhost-magento.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

