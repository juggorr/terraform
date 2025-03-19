resource "aws_subnet" "sbn-internet" {
  vpc_id = aws_vpc.vpc-internet.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block = var.sbn-cidr

  tags = {
    Name = "SBN-GA-PUBLIC1"
  }
}