terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.37.0"
    }
  }
}

# Configuration options
provider "aws" {
  region  = var.aws_region
  profile = "admin"
}