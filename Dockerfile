FROM ubuntu:16.04

WORKDIR /src

RUN apt-get update && apt-get install -y python-software-properties software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y && apt-get update && \
    apt-get install -y php7.2 php7.2-dev php7.2-fpm php7.2-curl php7.2-xml php7.2-zip php7.2-gmp php7.2-cli php7.2-mbstring git \
    libopus-dev libssl-dev build-essential && \
    git clone https://github.com/CopernicaMarketingSoftware/PHP-CPP && cd PHP-CPP && make -j$(nproc) && make install && \
    git clone https://github.com/danog/PrimeModule-ext && cd PrimeModule-ext && make -j$(nproc) && make install

WORKDIR /tg

ENTRYPOINT ["/usr/bin/php", "-e", "online.php"]
