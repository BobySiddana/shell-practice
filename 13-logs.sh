#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
   echo "ERROR:: please run with root access" &>>$LOG_FILE
   EXIT 1
else
   echo "you are running with root access" &>>$LOG_FILE
fi
VALIDATE(){
    if [ $1 -eq 0 ]
then 
    echo "installing $2 is ...SUCCESS" &>>$LOG_FILE
else
    echo "installing is $2 ...FAILURE" &>>$LOG_FILE
    EXIT 1
fi
}
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to be istalled" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql"
  else
      echo "mysql is already insalled.. noting to do" &>>$LOG_FILE
fi
dnf list installed pyton3
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to be istalled" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
  else
      echo "python3 is already insalled.. noting to do" &>>$LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to be istalled" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
  else
      echo "nginx is already insalled.. noting to do" &>>$LOG_FILE
fi


