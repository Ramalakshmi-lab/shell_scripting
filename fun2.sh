#!/bin/bash

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
    dnf install mariadb105-server -y
    validate $? "mysql instalation"
fi
    