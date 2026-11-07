#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"    


R="\033[31m"
G="\033[32m"
B="\033[34m"
Y="\033[33m"
P="\033[35m"
C="\033[36m"
W="\033[37m"
N="\033[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE 

    exit 1

fi

mkdir -p $LOGS_FOLDER 

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOGS_FILE
    fi

}

for package in $@ # sudo 17-coloors.sh nginx mysql nodejs
do 
    dnf list installed $package -y &>>$LOGS_FILE
    if [ $? -eq 0 ]; then
        echo -e "$package not installed, installing now $N" | tee -a $LOGS_FILE
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "$package installation"
    else 
        echo -e "$package already installed ... $Y SKIPPING $N" | tee -a $LOGS_FILE
    fi
echo -e "$R Hello World $N, $Y I am learning bash scripting $N" | tee -a $LOGS_FILE