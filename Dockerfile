FROM ubuntu:18.04

WORKDIR /src

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y && apt-get update && \
    apt-get install php8.1 php8.1-dev php8.1-xml php8.1-zip php8.1-gmp php8.1-cli php8.1-mbstring php8.1-ffi git libevent-dev -y && \
    pecl channel-update pecl.php.net && pecl install ev && pecl install event && \
    echo "extension=sockets.so" >> /etc/php/8.1/cli/php.ini && echo "extension=ev.so" >> /etc/php/8.1/cli/php.ini && echo "extension=event.so" >> /etc/php/8.1/cli/php.ini

WORKDIR /tg

ENTRYPOINT ["/usr/bin/php", "-e", "online.php"]
