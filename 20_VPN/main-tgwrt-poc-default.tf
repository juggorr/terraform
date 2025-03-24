#### TGWRT ####

resource "aws_ec2_transit_gateway_route_table" "tgwrt-poc-default" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-poc.id

  tags = {
    Name = "tgwrt-poc-default"
  }
}

#### TGWRT Route ####

resource "aws_ec2_transit_gateway_route" "tgwrt-poc-default-route-1" {
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.tgw-poc-tgwa-vpc-internet.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwrt-poc-default.id
}