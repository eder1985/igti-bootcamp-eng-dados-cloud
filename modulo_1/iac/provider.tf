provider "aws" {
  region = var.region
}

# Centralização do terraform.tfstate em um bucket s3

terraform {
  backend "s3" {
    bucket = "terraform-eder-igti-edc"
    key = "state/igti/edc/mod1/terraform.tsstate"
    region = "us-east-2"
  }
}