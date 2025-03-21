#### Route Table (Subnet) ####
resource "aws_route_table" "rt_workload" {
  vpc_id = aws_vpc.vpc-workload.id
  
  tags = {
    Name = "rt-workload"
  }
}

#### Route ####
resource "aws_route" "rt-workload-route-1" {
  route_table_id = aws_route_table.rt_workload.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_ec2_transit_gateway.tgw-poc.id

  depends_on = [aws_ec2_transit_gateway.tgw-poc]
}

#### Route Table Association ####
resource "aws_route_table_association" "rt-workload-rta-1" {
  route_table_id = aws_route_table.rt_workload.id
  subnet_id = aws_subnet.sbn-workload-1.id
}

resource "aws_route_table_association" "rt-workload-rta-2" {
  route_table_id = aws_route_table.rt_workload.id
  subnet_id = aws_subnet.sbn-workload-2.id
}