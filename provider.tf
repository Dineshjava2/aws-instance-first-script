
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
  access_key = ""
  secret_key = ""
}

