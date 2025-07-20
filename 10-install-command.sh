#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: please run with root access"
   EXIT 1
else
   echo "you are running with root access"
fi

dnf list installed MySQL
if [ $? -ne 0 ]
then
    echo "MySQL is not installed.. going to be istalled"
    dnf install MySQL -y
if [ $? -eq 0 ]
then 
    echo "MySQL installing is ...SUCCESS"
else
    echo "MySQL installing is ...FAILURE"
    EXIT 1
fi
  else
      echo "MySQL is already insalled.. noting to do":
fi