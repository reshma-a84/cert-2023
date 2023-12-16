terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

#     backend "s3" {
#     bucket = "cert-ayzb-ho-tfstate-bucket"
#     region = "us-east-1"
#     key    = "tfstate"
#   }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}

