#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of varaibles: $#"
echo "present working directory: $PWD"
echo "user running this script: $USER"
echo "Home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"