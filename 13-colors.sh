#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: please run with root access $N"
   EXIT 1
else
   echo "you are running with root access"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
then 
    echo -e "installing $2 is ...$G SUCCESS $N"
else
    echo -e "installing is $2 ...$ RFAILURE $N"
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
      echo -e "$Y mysql is already insalled.. noting to do $Y"
fi
dnf list installed pyton3
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to be istalled"
    dnf install python3 -y
    VALIDATE $? "python3"
  else
      echo -e "$Y python3 is already insalled.. noting to do $Y"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to be istalled"
    dnf install nginx -y
    VALIDATE $? "nginx"
  else
      echo -e "$Y nginx is already installed... nothing to do $Y"
fi


