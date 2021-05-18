#!/bin/bash

if [ ! -f session.madeline ]; then
    echo "First run"
    docker run -ti -v ${PWD}:/tg es1n/telegram_online:latest
    exit 0
fi

docker run -d --restart always --name telegram_online -v ${PWD}:/tg es1n/telegram_online:latest
exit 0
