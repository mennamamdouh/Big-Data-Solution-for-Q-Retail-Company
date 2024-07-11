# Big-Data-Solution-for-Q-Retail-Company

## About our Customer

__Q Company__, specializing in retail, operates branches across various regions and utilizes an E-commerce platform. It needs to build a data pipeline to manage its day-to-day operations. The pipeline manages the data sources, data ingestion, transformation and processing, and serving layers using big data tools such as *Apache Spark* and *Apache Hive*.

---

## System Overview

<div align="center">
    <img src="images/GitHub - Big Data Solution for Q-Retail Company.drawio.png" alt="Image" width=1000>
    <p><em>Big Data Solution Overview for Q-Retail Company</em></p>
</div>

Our data pipeline is just like any data engineering pipeline. It consists of the `5` famous stages:
- __Data Sources:__ Data comes from `2` sources, `csv` files (batch) and mobile application (streaming).
- __Ingestion:__ Ingesting data into a unified data storage system which is __HDFS__
- __Storage:__ Our main storage system is __HDFS__.
- __Transformation:__ Data processing is done using __Spark__ and __Spark Streaming__.
- __Serving:__ DWH Modeling in __Hive__ and Reporting.

The pipeline consists of `2` main parts, *Batch Processing* and *Stream Processing*.

So, our solution consists of many big data technologies and tools such as `Apache HDFS`, `Apache Spark`, `Apache Kafka`, and `Apache Hive`. Each service is used in a part of the system.
- `Apache HDFS`: used in data storage
- `Apache Spark`: used in data processing, in batch and streaming.
- `Apache Kafka`: used in stream processing.
- `Apache Hive`: used in building DWH model.

There're other tools used, `Python` is used in ingesting data into our system, and `Bash Scripting` for scheduling and orchestration.

---

## Repo Structure

Repo consists of `4` directories:
1. `Batch Processing`: A directory to hold the codes of batch part.
2. `Stream Processing`: A directory to hold the codes of streaming part.
3. `DWH Modeling`: A directory to hold the model of our DWH.
4. `Project Files`: The whole project files that are ready to be run on the docker image that is mentioned in the [itversity/data-engineering-spark](https://github.com/itversity/data-engineering-spark) repository.

    > To run the project, follow the steps in the [How to run ?](#how-to-run-) section.
5. `images`: A directory that holds the images used in the documentation.

---

## How to run ?