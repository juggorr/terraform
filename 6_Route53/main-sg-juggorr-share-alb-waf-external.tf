resource "aws_security_group" "sg-juggorr-share-alb-waf-external" {
  name = "SG-juggorr-SHARE-ALB-WAF-EXTERNAL"
  description = "SG for external WAF ALB in shared VPC"
  vpc_id = aws_vpc.vpc-juggorr-share.id

  tags = {
    Name = "SG-juggorr-SHARE-ALB-WAF-EXTERNAL"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-alb-waf-external-i00" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-share-alb-waf-external.id
}

resource "aws_security_group_rule" "sg-juggorr-share-alb-waf-external-e00" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-share-alb-waf-external.id
}