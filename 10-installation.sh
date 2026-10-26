#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

echo "Installing Nginx..."

apt update

if apt install nginx -y; then
    echo "Installing Nginx ... SUCCESS"
else
    echo "Installing Nginx ... FAILURE"
    exit 1
fi

echo "Starting Nginx..."

systemctl enable --now nginx

if systemctl is-active --quiet nginx; then
    echo "Nginx is running ... SUCCESS"
else
    echo "Nginx is running ... FAILURE"
    exit 1
fi