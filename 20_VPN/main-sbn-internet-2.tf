resource "aws_subnet" "sbn-internet-2" {
  vpc_id = aws_vpc.vpc-internet.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-2-number}"]
  cidr_block = var.sbn-internet-2-cidr

  tags = {
    Name = "sbn-internet-2"
  }
}