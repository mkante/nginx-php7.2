FROM ubuntu:16.04

COPY apt/ondrej-php-xenial.list /etc/apt/source.list.d/ondrej-php-xenial.list
COPY apt/nginx.list /etc/apt/source.list.d/nginx.list

COPY apt/keys/nginx_signing.key /tmp/nginx_signing.key
COPY apt/keys/ondrej-php.key /tmp/ondrej-php.key

RUN apt-key add /tmp/nginx_signing.key
RUN apt-key add /tmp/ondrej-php.key

RUN apt update

RUN apt install -y nginx \
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
  php7.2-soap

COPY fpm/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf

CMD ["supervisord", "-n", " -c", "/etc/supervisord.conf"]
