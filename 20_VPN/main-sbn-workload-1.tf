resource "aws_subnet" "sbn-workload-1" {
  vpc_id = aws_vpc.vpc-workload.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  cidr_block = var.sbn-workload-1-cidr

  tags = {
    Name = "sbn-workload-1"
  }
}