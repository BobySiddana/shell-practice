#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE

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
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to be istalled"
    dnf install nginx -y
    VALIDATE $? "nginx"
  else
      echo "nginx is already insalled.. noting to do":
fi