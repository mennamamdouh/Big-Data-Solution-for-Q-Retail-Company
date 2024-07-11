#!/bin/bash

# Go to the directory that holds all the code inside it
cd "/home/itversity/itversity-material/ITI_Material/Spark_Final_Project"

# Define today's date for the log files and make a directory to hold them if doesn't exist
today_date=$(date '+%Y-%m-%d')
if ! [ -d cron-logs ]; then
  mkdir cron-logs
fi

printf ">>>>>>>>>>>>>>WELCOME TO BIG DATA SOLUTION FOR Q-RETAIL COMPANY SCHEDULING SCRIPT<<<<<<<<<<<<<<\n\n" >> cron-logs/logfile-${today_date}.log

# Execute the first task which is Ingestion
printf "%s --> Executing Python Script for Ingestion...\n\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
/usr/bin/python3 ingestion-layer-code.py >> cron-logs/logfile-${today_date}.log 2>&1
if [ $? -eq 0 ]; then
    printf "\n%s --> Ingestion has been successfully done.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
else
    printf "\n%s --> WARNING: Ingestion was interrupted.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
    exit 1
fi

sleep 5
printf -- "\n--------------------------------------------------------------------------------------------------------------------------\n\n" >> cron-logs/logfile-${today_date}.log

# Set the environment for the notebook papermill command
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Execute the second task which is Cleaning
printf "%s --> Executing Jupyter Notebook for Cleaning...\n\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
/home/itversity/.local/bin/papermill cleaning-layer.ipynb cleaning-layer.ipynb -k Pyspark2 >> cron-logs/logfile-${today_date}.log 2>&1
if [ $? -eq 0 ]; then
    printf "\n%s --> Cleaning has been successfully done.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
else
    printf "\n%s --> WARNING: Cleaning was interrupted.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
    exit 1
fi

sleep 5
printf -- "\n--------------------------------------------------------------------------------------------------------------------------\n\n" >> cron-logs/logfile-${today_date}.log

# Execute the third task which is Transformation
printf "%s --> Executing Jupyter Notebook for Transformation...\n\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
/home/itversity/.local/bin/papermill transformation-layer.ipynb transformation-layer.ipynb -k Pyspark2 >> cron-logs/logfile-${today_date}.log 2>&1
if [ $? -eq 0 ]; then
    printf "\n%s --> Transformation has been successfully done.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
else
    printf "\n%s --> WARNING: Transformation was interrupted.\n" "$(date '+%Y-%m-%d %H:%M:%S %p')" >> cron-logs/logfile-${today_date}.log
    exit 1
fi

printf -- "\n--------------------------------------------------------------------------------------------------------------------------\n\n" >> cron-logs/logfile-${today_date}.log