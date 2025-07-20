#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
   echo "ERROR:: please run with root access" | tee -a $LOG_FILE
   EXIT 1
else
   echo "you are running with root access" | tee -a $LOG_FILE
fi
VALIDATE(){
    if [ $1 -eq 0 ]
then 
    echo "installing $2 is ...SUCCESS" | tee -a $LOG_FILE
else
    echo "installing is $2 ...FAILURE" | tee -a $LOG_FILE
    EXIT 1
fi
}
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to be istalled" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql"
  else
      echo "mysql is already insalled.. noting to do": | tee -a $LOG_FILE
fi
dnf list installed pyton3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to be istalled" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
  else
      echo "python3 is already insalled.. noting to do": | tee -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to be istalled" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
  else
    echo "nginx is not installed.. going to be istalled" | tee -a $LOG_FILE
      echo "nginx is already insalled.. noting to do": 
fi