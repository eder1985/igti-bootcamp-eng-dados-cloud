# resource "aws_s3_bucket" "datalake" {
#   bucket = "${var.base_bucket_name}-${var.environment}-${var.account_id}"
#   acl    = "private"
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
#   tags = {
#     IES   = "IGTI"
#     CURSO = "EDC"
#   }
# }

# resource "aws_s3_bucket" "stream" {
#   bucket = "datalake-eder-igti-edc-stream"
#   acl    = "private"

#   tags = {
#     IES   = "IGTI",
#     CURSO = "EDC"
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }

resource "aws_s3_bucket" "bucket_rais" {
  bucket = "datalake-eder-igti-edc-rais"
  acl    = "private"

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}