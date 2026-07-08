#!/bin/bash

dir="/tmp/myapp"
if [ ! -d $dir ]
then
    echo "directory not found"
    mkdir -p $dir
    echo -e "\e[32mdirectory created\e[0m"
else
    echo "directory already exists"
fi
