import ftplib
import boto3
from io import BytesIO

FTP_SERVER = 'ftp.mtps.gov.br'
S3_BUCKET = 'datalake-eder-igti-edc-rais'
S3_KEY_PREFIX = 'ftpfiles'

def upload_file_from_ftp_to_s3(ftp_server, ftp_file, s3_bucket, s3_key):
    # Conectar ao servidor FTP
    with ftplib.FTP() as ftp:
        ftp.connect(ftp_server, timeout=5000)
        ftp.login()
        # Mudar para o diretório do arquivo no servidor FTP
        ftp.cwd('/pdet/microdados/RAIS/2020/')

        # Listar os arquivos disponíveis no diretório
        list_files_ftp = ftp.nlst()
        print(list_files_ftp)

        # Conectar ao serviço S3
        s3 = boto3.Session(profile_name='default').resource('s3')

        print(f"Transferindo {ftp_file} para o S3...")
        with BytesIO() as data_file_ftp:
        # Baixar o arquivo do FTP para o objeto BytesIO
            ftp.retrbinary('RETR ' + ftp_file, data_file_ftp.write,)
            data_file_ftp.seek(0)
            # Fazer o upload do objeto BytesIO para o S3
            s3.Object(s3_bucket, s3_key + ftp_file).put(Body=data_file_ftp)

        ftp.close()
        del data_file_ftp


if __name__ == '__main__':
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_CENTRO_OESTE.7z', S3_BUCKET, S3_KEY_PREFIX)
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_MG_ES_RJ.7z', S3_BUCKET, S3_KEY_PREFIX)
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_NORDESTE.7z', S3_BUCKET, S3_KEY_PREFIX)
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_NORTE.7z', S3_BUCKET, S3_KEY_PREFIX)
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_SUL.7z', S3_BUCKET, S3_KEY_PREFIX)
    upload_file_from_ftp_to_s3(FTP_SERVER, '/pdet/microdados/RAIS/2020/RAIS_VINC_PUB_SP.7z', S3_BUCKET, S3_KEY_PREFIX)