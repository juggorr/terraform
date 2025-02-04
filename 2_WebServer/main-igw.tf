resource "aws_internet_gateway" "igw-juggorr-share" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  tags = {
    Name = "IGW-juggorr-SHARE"
  }
}