resource "aws_vpc" "vpc-internet" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-internet"
  }
}