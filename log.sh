#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

validate()
{
    if [ $1 -ne 0 ]
    then 
        echo "$2 ..failed"
        exit 1
    else
        echo "$2..success"
    fi

}

user=$(id -u)
if [ $user -ne 0 ]
then 
    echo "user sudo su"
else
    dnf install mariadb105-server -y &>>LOGFILE
    validate $? "mysql instalation"
fi
    