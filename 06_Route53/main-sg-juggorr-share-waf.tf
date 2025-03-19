resource "aws_security_group" "sg-juggorr-share-waf" {
  name = "SG-juggorr-SHARE-WAF"
  description = "SG for WAF service in shared VPC"
  vpc_id = aws_vpc.vpc-juggorr-share.id

  tags = {
    Name = "SG-juggorr-SHARE-WAF"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-waf-i00" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = aws_security_group.sg-juggorr-share-alb-waf-external.id # 틀렸던 파트
  security_group_id = aws_security_group.sg-juggorr-share-waf.id
}

resource "aws_security_group_rule" "sg-juggorr-share-waf-e00" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-share-waf.id
}