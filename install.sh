#!/bin/bash

user=$(id -u)

if [ "$user" -ne 0 ]; then
    echo "Run with super user access"
else
    echo "Installing MySQL..."
    yum install mariadb-server -y
fi

if [ $? -ne 0 ]; then
    echo "Installation failed"
    exit 1
else
    echo "Installed successfully"
fi

echo "Final end of script"
