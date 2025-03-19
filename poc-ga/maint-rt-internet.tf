resource "aws_route_table" "rt-internet" {
  vpc_id = aws_vpc.vpc-internet.id

  tags = {
    Name = "rt-internet"
  }
}

resource "aws_route" "rt-internet-route-1" {
  route_table_id = aws_route_table.rt-internet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw-internet.id
}

resource "aws_route_table_association" "rt-internet-rta-1" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id = aws_subnet.sbn-internet.id
}