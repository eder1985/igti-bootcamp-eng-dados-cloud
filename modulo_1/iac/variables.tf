variable "base_bucket_name" {
  default = "datalake-eder-igti-edc-tf"
}

variable "environment" {
  default = "prod"
}

variable "account_id" {
  default = "086556745643"
}

variable "region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMR"
}

variable "key_pair_name" {
  default = "eder-igti-ec2-key"
}

variable "airflow_subnet_id" {
  default = "subnet-4cef5427"
}

variable "vpc_id" {
  default = "vpc-0e2ddddded806bb75"
}