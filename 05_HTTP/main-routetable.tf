#### Route Table ####
resource "aws_route_table" "rt-juggorr-share-public" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  tags = {
    Name = "RT-juggorr-SHARE-PUBLIC"
  }
}

resource "aws_route_table" "rt-juggorr-share-private1" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  tags = {
    Name = "RT-juggorr-SHARE-PRIVATE1"
  }
}

resource "aws_route_table" "rt-juggorr-share-private2" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  tags = {
    Name = "RT-juggorr-SHARE-PRIVATE2"
  }
}

# RT PROD
resource "aws_route_table" "rt-juggorr-prod-private" {
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  tags = {
    Name = "RT-juggorr-PROD-PRIVATE"
  }
}

#### Route ####

resource "aws_route" "rt-juggorr-share-public-route-00" {
  route_table_id = aws_route_table.rt-juggorr-share-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw-juggorr-share.id
}

resource "aws_route" "rt-juggorr-share-public-route-01" {
  route_table_id = aws_route_table.rt-juggorr-share-public.id
  destination_cidr_block = var.vpc-prod-cidr
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
}

resource "aws_route" "rt-juggorr-share-private1-route-00" {
  route_table_id = aws_route_table.rt-juggorr-share-private1.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_network_interface.eni-juggorr-share-internal.id
}

resource "aws_route" "rt-juggorr-share-private1-route-01" {
  route_table_id = aws_route_table.rt-juggorr-share-private1.id
  destination_cidr_block = var.vpc-prod-cidr
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
}

resource "aws_route" "rt-juggorr-share-private2-route-00" {
  route_table_id = aws_route_table.rt-juggorr-share-private2.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_network_interface.eni-juggorr-share-internal.id
}

resource "aws_route" "rt-juggorr-share-private2-route-01" {
  route_table_id = aws_route_table.rt-juggorr-share-private2.id
  destination_cidr_block = var.vpc-prod-cidr
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
}

resource "aws_route" "rt-juggorr-prod-private-route-00" {
  route_table_id = aws_route_table.rt-juggorr-prod-private.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.tgw-juggorr.id
}


#### Route Table Association ####

resource "aws_route_table_association" "rt-juggorr-share-public-1" {
  subnet_id = aws_subnet.sbn-juggorr-share-public1.id
  
  route_table_id = aws_route_table.rt-juggorr-share-public.id
}

resource "aws_route_table_association" "rt-juggorr-share-public-2" {
  subnet_id = aws_subnet.sbn-juggorr-share-public2.id
  
  route_table_id = aws_route_table.rt-juggorr-share-public.id
}

resource "aws_route_table_association" "rt-juggorr-share-private1-1" {
  subnet_id = aws_subnet.sbn-juggorr-share-private1.id
  
  route_table_id = aws_route_table.rt-juggorr-share-private1.id
}

resource "aws_route_table_association" "rt-juggorr-share-private1-2" {
  subnet_id = aws_subnet.sbn-juggorr-share-private3.id
  
  route_table_id = aws_route_table.rt-juggorr-share-private1.id
}

resource "aws_route_table_association" "rt-juggorr-share-private2-1" {
  subnet_id = aws_subnet.sbn-juggorr-share-private2.id
  
  route_table_id = aws_route_table.rt-juggorr-share-private2.id
}

resource "aws_route_table_association" "rt-juggorr-share-private2-2" {
  subnet_id = aws_subnet.sbn-juggorr-share-private4.id
  
  route_table_id = aws_route_table.rt-juggorr-share-private2.id
}

# PROD
resource "aws_route_table_association" "rt-juggorr-prod-private1-1" {
  subnet_id = aws_subnet.sbn-juggorr-prod-private1.id
  route_table_id = aws_route_table.rt-juggorr-prod-private.id
}

resource "aws_route_table_association" "rt-juggorr-prod-private1-2" {
  subnet_id = aws_subnet.sbn-juggorr-prod-private3.id
  route_table_id = aws_route_table.rt-juggorr-prod-private.id
}

resource "aws_route_table_association" "rt-juggorr-prod-private2-1" {
  subnet_id = aws_subnet.sbn-juggorr-prod-private2.id
  route_table_id = aws_route_table.rt-juggorr-prod-private.id
}

resource "aws_route_table_association" "rt-juggorr-prod-private2-2" {
  subnet_id = aws_subnet.sbn-juggorr-prod-private4.id
  route_table_id = aws_route_table.rt-juggorr-prod-private.id
}