resource "aws_security_group" "sg-juggorr-share-utm-external" {
  name = "SG juggorr SHARE UTM EXTERNAL"
  description = "SG for UTM external network interface"
  vpc_id = aws_vpc.vpc-juggorr-share.id

  tags = {
    Name = "SG-juggorr-SHARE-UTM-EXTERNAL"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-utm-external-i" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "-1"
  cidr_blocks = ["27.122.140.10/32"]
  security_group_id = aws_security_group.sg-juggorr-share-utm-external.id
}

resource "aws_security_group_rule" "sg-juggorr-share-utm-external-e" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-share-utm-external.id
}