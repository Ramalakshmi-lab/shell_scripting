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
    exit 1
else 
    echo "installed using suoer user"
fi
for i in $@
do 
    echo "install: $i"
    dnf list install $i &>>LOGFILE 
    if [ $i -eq 0 ]
    then 
        echo "$i package already installed"
    else
        echo "$i package need to be installed"
    fi
done
