resource "aws_vpc" "vpc-juggorr-share" {
  cidr_block = "10.151.7.0/24"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-juggorr-SHARE"
  }
}