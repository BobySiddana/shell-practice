#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: please run with root access"
   EXIT 1
else
   echo "you are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to be istalled"
    dnf install mysql -y
if [ $? -eq 0 ]
then 
    echo "mysql installing is ...SUCCESS"
else
    echo "mysql installing is ...FAILURE"
    EXIT 1
fi
  else
      echo "mysql is already insalled.. noting to do":
fi