
# VPC SHARE
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

# VPC PROD
resource "aws_subnet" "sbn-juggorr-prod-private1" {
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  cidr_block = "10.151.8.64/27"
  availability_zone = data.aws_availability_zones.all.names[0]
  tags = {
    Name = "SBN-juggorr-PROD-PRIVATE1"
  }
}

resource "aws_subnet" "sbn-juggorr-prod-private2" {
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  cidr_block = "10.151.8.96/27"
  availability_zone = data.aws_availability_zones.all.names[2]
  tags = {
    Name = "SBN-juggorr-PROD-PRIVATE2"
  }
}

resource "aws_subnet" "sbn-juggorr-prod-private3" {
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  cidr_block = "10.151.8.128/27"
  availability_zone = data.aws_availability_zones.all.names[0]
  tags = {
    Name = "SBN-juggorr-PROD-PRIVATE3"
  }
}

resource "aws_subnet" "sbn-juggorr-prod-private4" {
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  cidr_block = "10.151.8.160/27"
  availability_zone = data.aws_availability_zones.all.names[2]
  tags = {
    Name = "SBN-juggorr-PROD-PRIVATE4"
  }
}