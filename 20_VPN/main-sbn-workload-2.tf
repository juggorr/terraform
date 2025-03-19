resource "aws_subnet" "sbn-workload-2" {
  vpc_id = aws_vpc.vpc-workload.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-2-number}"]
  cidr_block = var.sbn-workload-2-cidr

  tags = {
    Name = "sbn-workload-2"
  }
}