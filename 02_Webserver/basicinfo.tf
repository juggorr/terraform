provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  
  required_version = ">= 0.13"
}

data "aws_availability_zones" "all" {}