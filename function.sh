#!/bin/bash

validate()
{
    echo "$!"
    echo "$2"
}
user=$(id -u)
if [ $user -ne 0 ]
then
    echo "use sudo su"
else
    echo "installation started..."
    dnf install mariadb105-server -y
    validate $? "installation done"
fi

    