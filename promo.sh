#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

cd /opt
VALIDATE $? "Moving to opt directory"

rm -rf prometheus*
VALIDATE $? "removed existing prometheus"

wget https://github.com/prometheus/prometheus/releases/download/v3.2.0/prometheus-3.2.0.linux-amd64.tar.gz &>>$LOGFILE

tar -xvf prometheus-3.2.0.linux-amd64.tar.gz  &>>$LOGFILE
VALIDATE $? "extracted prometheus"

mv prometheus-3.2.0.linux-amd64 prometheus &>>$LOGFILE
VALIDATE $? "renamed prometheus"

cp /home/ec2-user/prometheus/prometheus.yml prometheus/prometheus.yml &>>$LOGFILE
VALIDATE $? "copied prometheus configuration"

cp /home/ec2-user/prometheus/prometheus.service /etc/systemd/system/prometheus.service &>>$LOGFILE
VALIDATE $? "created prometheus service"
 
systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "Daemon reload"

systemctl enable prometheus &>>$LOGFILE
VALIDATE $? "enabled prometheus"

systemctl start prometheus &>>$LOGFILE
VALIDATE $? "Started prometheus"
