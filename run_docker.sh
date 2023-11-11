#!/bin/bash

if [ ! -d session.madeline ]; then
    echo "First run"
    docker run -ti -v ${PWD}:/app es1n/telegram_online:latest php /app/online.php
    exit 0
fi

docker run --restart always  -d --name telegram_online -v ${PWD}:/app hub.madelineproto.xyz/danog/madelineproto:latest php /app/online.php
exit 0
