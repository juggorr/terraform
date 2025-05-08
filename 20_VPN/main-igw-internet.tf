resource "aws_internet_gateway" "igw-internet" {
  vpc_id = aws_vpc.vpc-internet.id

  tags = {
    Name = "igw-internet"
  }
}