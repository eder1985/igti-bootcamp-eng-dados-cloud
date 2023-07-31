import boto3
import pandas as pd

s3_client = boto3.client('s3')

s3_client.upload_file('modulo_1/data/enem/MICRODADOS_ENEM_2020.csv', 'datalake-eder-enem','raw-data/MICRODADOS_ENEM_2020.csv',)

# Via awscli: 
# aws s3 cp modulo_1/data/enem/MICRODADOS_ENEM_2020.csv s3://datalake-eder-enem/raw-data/MICRODADOS_ENEM_2020.csv