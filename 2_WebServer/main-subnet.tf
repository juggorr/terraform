resource "aws_subnet" "sbn-juggorr-share-public1" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.0/27"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "SBN-juggorr-SHARE-PUBLIC1"
  }
}

resource "aws_subnet" "sbn-juggorr-share-public2" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.32/27"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "SBN-juggorr-SHARE-PUBLIC2"
  }
}

resource "aws_subnet" "sbn-juggorr-share-private1" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.64/27"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "SBN-juggorr-SHARE-PRIVATE1"
  }
}

resource "aws_subnet" "sbn-juggorr-share-private2" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.96/27"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "SBN-juggorr-SHARE-PRIVATE2"
  }
}

resource "aws_subnet" "sbn-juggorr-share-private3" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.128/27"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "SBN-juggorr-SHARE-PRIVATE3"
  }
}

resource "aws_subnet" "sbn-juggorr-share-private4" {
  vpc_id = aws_vpc.vpc-juggorr-share.id
  cidr_block = "10.151.7.160/27"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "SBN-juggorr-SHARE-PRIVATE4"
  }
}