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
    token = "<git token>"
}

