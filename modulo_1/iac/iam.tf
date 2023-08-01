resource "aws_iam_role" "lambda" {
  name = "IGTILambdaRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "AssumeRole"
    }
  ]
}
EOF

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

}



resource "aws_iam_policy" "lambda" {
  name        = "IGTIAWSLambdaBasicExecutionRolePolicy"
  path        = "/"
  description = "Provides write permissions to CloudWatch Logs, S3 buckets and EMR Steps"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticmapreduce:*"
            ],
            "Resource": "*"
        },
        {
          "Action": "iam:PassRole",
          "Resource": ["arn:aws:iam::086556745643:role/AmazonEMR-ServiceRole-20230723T053658",
                       "arn:aws:iam::086556745643:role/AmazonEMR-InstanceProfile-20230723T053640"],
          "Effect": "Allow"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}

