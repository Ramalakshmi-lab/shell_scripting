#!/bin/bash

user=$(id -u)
if [ $user -ne 0 ]
then 
    echo " run with super user access"
    exit 1
else
    echo "install the mysql"
fi
yum install mysqll -y
if [ $? -ne 0 ]
then 
    echo "installation failed"
    exit 1
fi
echo "final"
