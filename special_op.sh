#!/bin/bash

echo "variables passed: $@"
echo "no of varoables: $#"
echo "script name: $0"
echo "pwd: $PWD"
echo "home: $HOME"
echo "user: $USER"
echo "hostname: $HOSTNAME"
echo " pid: $$"
sleep 60 &
echo "pid of background: $!"
