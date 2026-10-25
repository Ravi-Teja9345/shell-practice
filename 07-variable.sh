#!/bin/bash

echo "All args passed to the script are: $@"
echo "Number of args passed to the script are: $#"
echo "Scriptname is: $0"
echo "Present directory is: $PWD"
echo "Current user is: $USER"
echo "present directory is: $PWD"
echo "who is running: $USER"
echo "Home directory of curent user is: $HOME"
echo "PiD of current script is: $$"
sleep 100 &
echo  "PID of recently executed background process is: $!"
echo "All args passed to the script are: $@"
