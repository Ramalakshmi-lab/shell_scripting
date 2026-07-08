#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(basename $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

validate() {
    if [ $1 -ne 0 ]; then 
        echo "$2 ..failed"
        exit 1
    else
        echo "$2 ..success"
    fi
}

user=$(id -u)
if [ $user -ne 0 ]; then 
    echo "Run as super user (sudo su)"
    exit 1
else 
    echo "Running with super user access"
fi

for i in "$@"; do 
    echo "Checking: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]; then 
        echo "$i package already installed"
    else
        echo "$i package needs to be installed"
        dnf install -y $i &>>$LOGFILE
        validate $? "$i installation"
    fi
done
