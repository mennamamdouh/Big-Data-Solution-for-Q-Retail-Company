# Big-Data-Solution-for-Q-Retail-Company

## Overview of Batch Processing Pipeline

Our Batch Processing Pipeline consists of multiple stages and layers, started from the data source and ended with the serving layer which represents our the Q-Retail Company's clients.

The data source is divided into `6` batches. Each batch has 3 files, `branches_SS_raw_n.csv`, `sales_agents_SS_raw_n.csv`, and `sales_transactions_SS_raw_n.csv`, where `n` represents the batch number.

Data batches arrive hour-by-hour and need to be ingested as is in a *raw layer*, partitioned by days and hours, then get cleaned and transformed to be ready for the clients.

*The architecture of the pipeline is as follows:*
1. Bronze Layer &rarr; Ingesting data as is in.
2. Silver Layer &rarr; Data cleaning and pre-processing.
3. Gold Layer &rarr; Data transformation.

---

## Ingestion Layer

Ingestion layer moves the data from data source to the first layer which is the *Bronze Layer*.

[Python Code](Batch Processing\ingestion-layer-code.py) is used to perform this task, and it's divided as follows:
1. Moving files to staging area
2. Partitioning files by day and hour
    a. Make a directory to represent the current date on HDFS under the Bronze directory
    b. For each batch, make a directory to represent the hour of ingestion (the current hour)
3. Uploading each batch's files (the 3 files) to the corresponding directory on HDFS
4. Removing the files from the data source to avoid uploading the same batch again

*Here is a snapshot of the Logs*

<div align="center">
  <img src="images/ingestion-logs.png" alt="Image" width=1000>
  <p><em>Snapshot of Ingesting Batch 1</em></p>
</div>


---