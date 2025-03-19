resource "aws_security_group" "sg-juggorr-prod-web" {
  name = "SG juggorr PROD WEB"
  description = "Bastion Host"
  vpc_id = aws_vpc.vpc-juggorr-prod.id

  tags = {
    Name = "SG-juggorr-PROD-WEB"
  }
}

resource "aws_security_group_rule" "sg-juggorr-prod-web-i00" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["10.151.7.64/27"]
  security_group_id = aws_security_group.sg-juggorr-prod-web.id
}

resource "aws_security_group_rule" "sg-juggorr-prod-web-e00" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-prod-web.id
}