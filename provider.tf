
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "${var.region}"
  access_key = "AKIA2IO7N7GG4N6UZMX2"
  secret_key = "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"
}

