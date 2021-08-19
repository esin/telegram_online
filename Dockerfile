FROM ubuntu:18.04

WORKDIR /src

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y && apt-get update && \
    apt-get install -y php7.4 php7.4-dev php7.4-xml php7.4-zip php7.4-gmp php7.4-cli php7.4-mbstring php7.4-json git \
    libopus-dev libssl-dev build-essential sudo && \
    apt-get install -y libopus-dev libssl-dev php$(echo "<?php echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;" | php)-dev && \
    git clone https://github.com/danog/PHP-CPP && cd PHP-CPP && make -j$(nproc) &&  make install && cd .. && \
    git clone --recursive https://github.com/danog/php-libtgvoip && cd php-libtgvoip && make && make install && cd .. && \
    git clone https://github.com/danog/PrimeModule-ext && cd PrimeModule-ext && make -j$(nproc) &&  make install


WORKDIR /tg

ENTRYPOINT ["/usr/bin/php", "-e", "online.php"]
