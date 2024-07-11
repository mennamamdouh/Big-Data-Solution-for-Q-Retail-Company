# Big-Data-Solution-for-Q-Retail-Company

This directory contains all the files needed to run the project successfully. It has:

1. `data`: A directory that contains `6` groups, which represent the batches that will be ingested to our system. Each group has `3` files that are mentioned in the [Batch Processing](/Batch%20Processing/) directory.
2. `staging-area`: The directory which is used in the ingestion layer. Data is copied to it before getting removed from the `data` directory after ingestion.
3. `Logs`: A directory that contains `3` other directories for `Spark Job Logs`, `Data Reports`, and `Ingestion Logs`. Each of them has log files for every day the system runs, and every hour a batch gets ingested.
4. `cron-logs`: A directory that contains a log file for every day the system runs through `crontab`.
5. Codes:
    
    a. `ingestion-layer.py`: This is the code that is responsible of ingesting data into HDFS.

    b. `cleaning-layer.ipynb`: This is the notebook that is responsible of cleaning data.

    c. `transformation-layer.ipynb`: This is the notebook that is responsible of transforming and restructuring data to the DWH model.

    d. `scheduling-script`: This is the script which is responsible of scheduling and orchestrating the pipeline's jobs.