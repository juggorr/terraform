#### Transit Gateway ####
resource "aws_ec2_transit_gateway" "tgw-juggorr" {
  description = "transit gateway test"
  
  tags = {
    Name = "TGW-juggorr"
  }
}

#### Transit Gateway Route Table ####
resource "aws_ec2_transit_gateway_route_table" "tgw-rt-juggorr" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id

  tags = {
    Name = "TGW-RT-juggorr"
  }
}

resource "aws_ec2_transit_gateway_route" "tgw-rt-juggorr-route-00" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt-juggorr.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.tgwa-juggorr-share.id
}

#### Transit Gateway VPC Attachment ####
resource "aws_ec2_transit_gateway_vpc_attachment" "tgwa-juggorr-share" {
  subnet_ids = [aws_subnet.sbn-juggorr-share-private1.id, aws_subnet.sbn-juggorr-share-private2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
  vpc_id = aws_vpc.vpc-juggorr-share.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "TGWA-juggorr-SHARE"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgwa-juggorr-prod" {
  subnet_ids = [aws_subnet.sbn-juggorr-prod-private1.id, aws_subnet.sbn-juggorr-prod-private2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "TGWA-juggorr-PROD"
  }
}

#### Transit Gateway Route Table Association ####
resource "aws_ec2_transit_gateway_route_table_association" "tgw-rta-juggorr-share" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgwa-juggorr-share.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt-juggorr.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rta-juggorr-prod" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgwa-juggorr-prod.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt-juggorr.id
}

### Transit Gateway Route Table Propagation ####
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rtp-juggorr-share" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgwa-juggorr-share.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt-juggorr.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rtp-juggorr-prod" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgwa-juggorr-prod.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt-juggorr.id
}