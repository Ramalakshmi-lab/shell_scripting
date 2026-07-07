#!/bin/bash

num=$1

if [ $num -gt 10 ]
then
    echo "$num >10"
else
    echo "$num<10"
fi
