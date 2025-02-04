### Route Table###

resource "aws_route_table" "rt-juggorr-share-public" {
  vpc_id = aws_vpc.vpc-juggorr-share.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-juggorr-share.id
  }

  tags = {
    Name = "RT-juggorr-SHARE-PUBLIC"
  }
}

resource "aws_route_table" "rt-juggorr-share-private1" {
  vpc_id = aws_vpc.vpc-juggorr-share.id

  ## 과제 2-1
  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = aws_network_interface.eni-juggorr-share-internal.id
  }##

  tags = {
    Name = "RT-juggorr-SHARE-PRIVATE1"
  }
}

resource "aws_route_table" "rt-juggorr-share-private2" {
  vpc_id = aws_vpc.vpc-juggorr-share.id

  ## 과제 2-1
  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = aws_network_interface.eni-juggorr-share-internal.id
  }##

  tags = {
    Name = "RT-juggorr-SHARE-PRIVATE2"
  }
}

### Route Table Association ###

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