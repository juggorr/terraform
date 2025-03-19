#### Route Table (Subnet) ####

resource "aws_route_table" "rt_internet" {
  vpc_id = aws_vpc.vpc-internet.id

  tags = {
    Name = "rt-internet"
  }
}

#### Route ####
resource "aws_route" "rt-internet-route-1" {
  route_table_id         = aws_route_table.rt_internet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-internet.id
}

resource "aws_route" "rt-internet-route-2" {
  route_table_id = aws_route_table.rt_internet.id
  destination_cidr_block = "10.11.0.128/25"
  gateway_id = aws_ec2_transit_gateway.tgw-poc.id
}

#### Route Table Association ####
resource "aws_route_table_association" "rt-internet-rta-1" {
  route_table_id = aws_route_table.rt_internet.id
  subnet_id = aws_subnet.sbn-internet-1.id
}

resource "aws_route_table_association" "rt-internet-rta-2" {
  route_table_id = aws_route_table.rt_internet.id
  subnet_id = aws_subnet.sbn-internet-2.id
}