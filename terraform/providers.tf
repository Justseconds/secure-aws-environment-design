terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Used to build account-scoped ARNs (e.g., in the CloudTrail bucket policy).
data "aws_caller_identity" "current" {}
