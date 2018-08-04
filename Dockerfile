FROM ubuntu:16.04

LABEL author="mkante"
LABEL description="Container with Nginx 1.14 and php 7.2.8"
LABEL name="nginx-php7.2.8"

COPY apt/ondrej-php-xenial.list /etc/apt/sources.list.d/ondrej-php-xenial.list
COPY apt/nginx.list /etc/apt/sources.list.d/nginx.list

COPY apt/keys/nginx_signing.key /tmp/nginx_signing.key
COPY apt/keys/ondrej-php.key /tmp/ondrej-php.key

RUN apt-key add /tmp/nginx_signing.key && \
	apt-key add /tmp/ondrej-php.key && \
	apt update && \
	apt install -y supervisor nginx \
	php7.2 \
  php7.2-zip \
  php7.2-curl \
  php7.2-fpm \
  php7.2-gd \
  php7.2-json \
  php7.2-mysql \
  php7.2-pgsql \
  php7.2-sqlite3 \
  php7.2-xml \
  php7.2-bcmath \
  php7.2-mbstring \
  php7.2-soap

COPY fpm/* /etc/php/7.2/fpm/
COPY supervisord.conf /etc/supervisord.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/www/index.php /var/www/html/
COPY start.sh start.sh

RUN mkdir /run/php

CMD ["/start.sh"]
