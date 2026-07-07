#!/bin/bash

user=$(id -u)

if [ "$user" -ne 0 ]; then
    echo "Run with super user access"
    exit 1
else
    echo "Installing MySQL..."
    yum install mariadb-server -y

    if [ $? -ne 0 ]; then
        echo "Installation failed"
        exit 1
    else
        echo "Installed successfully"
    fi
fi

echo "Final end of script"
