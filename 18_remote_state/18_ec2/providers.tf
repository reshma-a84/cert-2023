terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }

  backend "s3" {
    bucket = "cert-ayzb-ho-remote-tfstate-bucket"
    region = "us-east-1"
    key    = "tfstate/hands-on"
  }

  required_version = "~> 1.6.0"
}

provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_config_files      = ["/Users/reshu/.aws/config"]
  shared_credentials_files = ["/Users/reshu/.aws/credentials"]

  default_tags {
    tags = {
      Environment = "TF_Certification"
      Version     = "2.0"
    }
  }
}