import zipfile
import boto3
from io import BytesIO

S3_BUCKET = 'datalake-eder-igti-edc-rais'
S3_KEY_PREFIX = 'ftpfiles/'

zip_objeto = s3.Object(bucket_name="nome_bucket", key="S3_KEY_PREFIX")
zip_em_memoria = BytesIO(zip_obj.get()["Body"].read())

zip = zipfile.ZipFile(zip_em_memoria)
for arquivo in zip.namelist():
    s3.meta.client.upload_fileobj(
        zip.open(arquivo),
        Bucket=bucket,
        Key=f'{arquivo}'
    )