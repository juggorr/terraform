#### TGW ####

resource "aws_ec2_transit_gateway" "tgw-poc" {
  description = "TGW for Seoul Region"
  amazon_side_asn = var.tgw-poc-bgp-asn

  tags = {
    Name = "tgw-poc"
  }
}

#### TGW VPC Attachent ####
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-poc-tgwa-vpc-internet" {
  subnet_ids = [aws_subnet.sbn-internet-1.id, aws_subnet.sbn-internet-2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw-poc.id
  vpc_id = aws_vpc.vpc-internet.id
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true

  tags = {
    Name = "tgw-poc-tgwa-vpc-internet"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-poc-tgwa-vpc-workload" {
  subnet_ids = [aws_subnet.sbn-workload-1.id, aws_subnet.sbn-workload-2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw-poc.id
  vpc_id = aws_vpc.vpc-workload.id
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true

  tags = {
    Name = "tgw-poc-tgwa-vpc-workload"
  }
}
