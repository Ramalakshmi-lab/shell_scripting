#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
echo "$LOGFILE"
R="\e[31m"
G="\e[32m"
N="\e[0m"

validate()
{
    if [ $1 -ne 0 ]
    then 
        echo -e " $R $2 ..failed $N"
        exit 1
    else
        echo -e " $G $2..success $N"
    fi

}

user=$(id -u)
if [ $user -ne 0 ]
then 
    echo "user sudo su"
else
    dnf install mariadb105-server -y &>>$LOGFILE
    validate $? "mysql installation"
fi
    