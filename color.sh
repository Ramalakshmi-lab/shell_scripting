#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
echo "$LOGFILE"

validate()
{
    if [ $1 -ne 0 ]
    then 
        echo -e "\e[31m $2 ..failed\e[0m"
        exit 1
    else
        echo -e "\e[32m $2..success\e[0m"
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
    