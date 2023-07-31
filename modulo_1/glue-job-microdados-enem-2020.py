import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Ler os dados do arquivo fonte
raw_data = spark.read.format('csv').option('header', True).option('inferSchema', True).option('delimiter', ';').load('s3://datalake-eder-enem/raw-data/')

# Escrita dos dados no formato parquet
raw_data.write.mode('overwrite').format('parquet').save('s3://datalake-eder-enem/consumer-zone/enem2020/')

#job.commit()