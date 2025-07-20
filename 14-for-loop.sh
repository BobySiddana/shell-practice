#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 
PACKAGES=("mysql" "python" "nginx")

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
for package in $@
do
     dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "$package is not installed.. going to be istalled" | tee -a $LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
else
    echo "$package is already insalled.. noting to do" | tee -a $LOG_FILE
fi
done