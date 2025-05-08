resource "aws_subnet" "sbn-internet-1" {
  vpc_id = aws_vpc.vpc-internet.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block = var.sbn-internet-1-cidr

  tags = {
    Name = "sbn-internet-1"
  }
}