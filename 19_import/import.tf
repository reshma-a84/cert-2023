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

import {
  to = aws_instance.id
  id = "i-0e837d6f62bf8091b"
}