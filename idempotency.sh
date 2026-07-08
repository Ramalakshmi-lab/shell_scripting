#!/bin/bash

dir="/tmp/myapp"
if [ ! -d $dir ]
then
    echo "directory not found"
    mkdir -p $dir
else
    echo "directory already exists"
fi
