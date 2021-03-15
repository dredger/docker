#!/usr/bin/env bash


FILE=/usr/share/nginx/html/.env.docker
if test -f "$FILE"; then
    echo "$FILE exists."
fi
