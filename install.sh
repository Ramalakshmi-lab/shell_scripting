#!/bin/bash

user=$(id -u)
if [ $user -ne 0 ]
then 
    echo " run with super user access"
    exit 1
else
    echo "install the mysql"
fi
dnf install mysql -y