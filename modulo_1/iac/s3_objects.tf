resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark/job_spark_from_tf.py"
  acl    = "private"
  source = "../glue-job-imdb-movies.py"
  etag   = filemd5("../glue-job-imdb-movies.py")
}