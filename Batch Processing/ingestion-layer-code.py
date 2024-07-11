import os
import shutil
from datetime import date, datetime
import logging

# Create today's directory, if doesn't exist, to move the files to
today = date.today().isoformat()
os.system(f'/opt/hadoop/bin/hdfs dfs -mkdir -p hdfs:///user/itversity/q-retail-company/bronze/{today}')

# Set the logger configurations
ingestion_logger = logging.getLogger('IngestionLogs')
logger_file_name = f'Logs/IngestionLogs/Ingestion-{today}.log'
logging.basicConfig(filename=logger_file_name, filemode='a', level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')

ingestion_logger.info(f'HELLO .. HERE WE GO :)')

# Get the current working directory
cwd = os.getcwd()

# Hold the data directory, our data source
data_directory_path = cwd + "/data"
data_directories = os.listdir(data_directory_path)
ingestion_logger.debug(f'Starting processing and partitioning data for batch named {data_directories[0]}...')

# Get the current hour, minute, second to name each group reaches from the source
current = datetime.now()
current_group_name = f'hour-{current.hour}'

def move_to_staging(current_group_path, current_group_name):
    # Create a staging directory to keep the data source
    staging_directory_path = cwd + f"/staging_area/{today}"
    if not os.path.exists(staging_directory_path):
        os.mkdir(staging_directory_path)
    staging_group = f"{staging_directory_path}/{current_group_name}"
    ingestion_logger.debug(f'Copying {current_group_name} to the staging area...')
    try:
        return shutil.copytree(current_group_path, staging_group)
    except:
        return null

def partition_data():
    try:
        ingestion_logger.debug(f'Creating directory for {current_group_name} on HDFS...')
        
        # Create a directory for the current group on hdfs
        os.system(f'/opt/hadoop/bin/hdfs dfs -mkdir -p hdfs:///user/itversity/q-retail-company/bronze/{today}/{current_group_name}')
        
        # Hold the current group to move its files
        current_group = data_directories[0]
        current_group_path = os.path.join(data_directory_path, current_group)
        
        # Move the current group to the staging area and get its path
        current_group_staging_path = move_to_staging(current_group_path, current_group)
        if current_group_staging_path:
            ingestion_logger.info(f'{current_group_name} was moved to the staging area successfully.')
        else:
            ingestion_logger.warning(f'{current_group_name} wasn''t moved to the staging area.')
        
        # Move the files file by file to its directory
        for file in os.listdir(current_group_path):
            file_full_path = os.path.join(current_group_staging_path, file)
            ingestion_logger.debug(f'Uploading {file} to HDFS...')
            try:
                os.system(f'/opt/hadoop/bin/hdfs dfs -put {file_full_path} hdfs:///user/itversity/q-retail-company/bronze/{today}/{current_group_name}')
                ingestion_logger.info(f'{file} was uploaded to HDFS successfully.')
            except:
                ingestion_logger.warning(f'{file} cannot be uploaded to HDFS.')
        
        ingestion_logger.info(f'Batch named {data_directories[0]} was uploaded to the bronze layer successfully.')
        
        # Remove the group from the data directory
        try:
            shutil.rmtree(current_group_path)
            ingestion_logger.info(f'{current_group_name} was removed from data directory.')
        except Exception as error:
            print("An exception occurred:", error)
            ingestion_logger.warning(f'{current_group_name} cannot be removed from data directory.')
        
    except:
        pass
    
partition_data()

ingestion_logger.info(f'PYTHON MISSION ACCOMPLISHED!\
                    \n---------------------------------------------------------------------------------------------------------------------')