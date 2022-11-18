terraform {
  required_version = ">=1.3.0"
  cloud {
    organization = "integration-testing"

    workspaces {
      name = "intel-aws-mysql-sentinel"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36.0"
    }
  }
}
