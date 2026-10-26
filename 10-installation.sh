#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi 

echo "Installing Nginx"
ec2 install nginx -y

if [ $? -eq 0 ]; then
    echo "Installing Nginx ... FAILURE"
    exit 1
else
    
 echo "Installing Nginx ... SUCCESS"
fi