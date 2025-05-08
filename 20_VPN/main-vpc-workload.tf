resource "aws_vpc" "vpc-workload" {
  cidr_block = var.vpc-workload-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-workload"
  }
}