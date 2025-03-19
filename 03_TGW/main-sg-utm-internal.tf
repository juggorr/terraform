resource "aws_security_group" "sg-juggorr-share-utm-internal" {
  name = "SG juggorr SHARE UTM INTERNAL"
  description = "SG for UTM internal network interface"
  vpc_id = aws_vpc.vpc-juggorr-share.id
  
  tags = {
    Name = "SG-juggorr-SHARE-UTM-INTERNAL"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-utm-internal-i" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [var.vpc-cidr, var.vpc-prod-cidr]
  security_group_id = aws_security_group.sg-juggorr-share-utm-internal.id
}

resource "aws_security_group_rule" "sg-juggorr-share-utm-internal-e" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [var.vpc-cidr, var.vpc-prod-cidr]
  security_group_id = aws_security_group.sg-juggorr-share-utm-internal.id
}