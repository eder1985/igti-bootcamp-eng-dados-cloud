# resource "aws_s3_bucket_object" "codigo_spark" {
#   bucket = aws_s3_bucket.datalake.id
#   key    = "emr-code/pyspark/job_spark/job_spark_from_tf.py"
#   acl    = "private"
#   source = "../glue-job-imdb-movies.py"
#   etag   = filemd5("../glue-job-imdb-movies.py")
# }

# resource "aws_s3_bucket_object" "delta_insert" {
#   bucket = aws_s3_bucket.datalake.id
#   key    = "emr-code/pyspark/job_spark/01_delta_spark_insert.py"
#   acl    = "private"
#   source = "../etl/01_delta_spark_insert.py"
#   etag   = filemd5("../etl/01_delta_spark_insert.py")
# }

# resource "aws_s3_bucket_object" "delta_upsert" {
#   bucket = aws_s3_bucket.datalake.id
#   key    = "emr-code/pyspark/job_spark/02_delta_spark_upsert.py"
#   acl    = "private"
#   source = "../etl/02_delta_spark_upsert.py"
#   etag   = filemd5("../etl/02_delta_spark_upsert.py")
# }

resource "aws_s3_bucket_object" "ftp_to_s3_script" {
  bucket = aws_s3_bucket.bucket_rais.id
  key    = "scripts/python/transfer-ftp-to-s3.py"
  acl    = "private"
  source = "../etl/transfer-ftp-to-s3.py"
  etag   = filemd5("../etl/transfer-ftp-to-s3.py")
}