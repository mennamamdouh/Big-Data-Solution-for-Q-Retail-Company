# Big-Data-Solution-for-Q-Retail-Company

## Cleaning Layer | Silver Layer

Cleaning layer is responsible of pre-processing data in *Bronze Layer* and store is in *Silver Layer*.

(Jupyer Notebook) is used to work on this stage. The code is written using `pyspark` and run on a `SparkSession`.

*It's divided into multiple tasks:*

1. Reading the 3 files in each ingested batch, file by file.
2. For each file:

    a. __Schema Handling:__ To infers a suitable schema to the file's columns

    b. __Trimming String Columns:__ To ensure a clean strings without any extra spaces

    c. __Cleaning `customer_email`:__ To get rid of any invalid emails such as those who have special characters or not following the email format
3. Loading the files again into __HDFS__ but in the *Silver Layer*.

This step also generates 2 types of logs:

1. Spark Job Logs
    - Logs the excution of the code
    <div align="center">
        <img src="images/spark-job-logs.png" alt="Image" width=1000>
        <p><em>Snapshot of Spark Job Logs</em></p>
    </div>
2. Data Reports
    - Logs some information about each pre-processed file such as it's columns and their data types and whether it has duplicates or not.
    <div align="center">
        <img src="images/data-report.png" alt="Image" width=1000>
        <p><em>Snapshot of Data Report</em></p>
    </div>