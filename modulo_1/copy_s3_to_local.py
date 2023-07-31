import boto3
import pandas as pd

s3_client = boto3.client('s3')

s3_client.download_file('datalake-eder-igti-edc','data/raw/movies/movies.csv','data/imdb/movies-from-s3.csv')

df = pd.read_csv('data/imdb/movies-from-s3.csv')
print(df)

# Via awscli: 
# aws s3 cp s3://datalake-eder-igti-edc/data/raw/movies/movies.csv data/imdb/movies-from-s3.csv