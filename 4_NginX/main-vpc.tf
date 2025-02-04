resource "aws_vpc" "vpc-juggorr-share" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-juggorr-SHARE"
  }
}

resource "aws_vpc" "vpc-juggorr-prod" {
  cidr_block = var.vpc-prod-cidr
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-juggorr-PROD"
  }
}