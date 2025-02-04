resource "aws_security_group" "sg-juggorr-prod-alb-web" {
  name = "SG-juggorr-PROD-ALB-WEB"
  description = "SG for WEB ALB in production VPC"
  vpc_id = aws_vpc.vpc-juggorr-prod.id

  tags = {
    Name = "SG-juggorr-PROD-ALB-WEB"
  }
}

resource "aws_security_group_rule" "sg-juggorr-prod-alb-web-i00" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["10.151.7.96/27"] # 10.151.7.64/27 실제환경에선 추가, 현재는 WAF가 한대
  security_group_id = aws_security_group.sg-juggorr-prod-alb-web.id
}

resource "aws_security_group_rule" "sg-juggorr-prod-alb-web-e00" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-prod-alb-web.id
}