#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: please run with root access"
   EXIT 1
else
   echo "you are running with root access"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
then 
    echo "installing $2 is ...SUCCESS"
else
    echo "installing is $2 ...FAILURE"
    EXIT 1
fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to be istalled"
    dnf install mysql -y
    VALIDATE $? "mysql"
  else
      echo "mysql is already insalled.. noting to do":
fi
dnf list installed pyton3
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to be istalled"
    dnf install python3 -y
    VALIDATE $? "python3"
  else
      echo "python3 is already insalled.. noting to do":
fi





