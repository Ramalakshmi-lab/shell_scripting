#!/bin/bash

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
done
