terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_config_files      = ["/Users/reshu/.aws/config"]
  shared_credentials_files = ["/Users/reshu/.aws/credentials"]
}

resource "random_string" "ho_random_string" {
  special = false
  upper   = false
  length  = 4
}

locals {
  prefix = "cert-${random_string.ho_random_string.result}"
}

resource "aws_s3_bucket" "ho_s3_bucket" {
  bucket = "${local.prefix}-ho-tfstate-bucket"

}

output "s3_bucket_name" {
  value = aws_s3_bucket.ho_s3_bucket.id
}

