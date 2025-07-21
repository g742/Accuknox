#!/bin/bash

APP_URL="https://wisecow.work.gd"

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$APP_URL")

if [[ "$HTTP_STATUS" -eq 0 ]]; 
then
    echo "Application is up"
else
    echo "Application is down"
fi

