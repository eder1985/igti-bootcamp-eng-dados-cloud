resource "aws_glue_job" "ftp_to_s3_job" {
  name         = "ftp_to_s3_job"
  role_arn     = aws_iam_role.glue_role.arn
  glue_version = "4.0"

  command {
    script_location = "s3://${aws_s3_bucket.bucket_rais.id}/scripts/python/transfer-ftp-to-s3.py"
  }
}