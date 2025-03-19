resource "aws_security_group" "sg-internet" {
  name = "sg internet"
  vpc_id = aws_vpc.vpc-internet.id
  description = "Win svr"

  tags = {
    Name = "sg-internet"
  }
}

resource "aws_security_group_rule" "sg-internet-i" {
  type = "ingress"
  from_port = 3389
  to_port = 3389
  protocol = "tcp"
  cidr_blocks = ["27.122.140.10/32"]
  security_group_id = aws_security_group.sg-internet.id
}

resource "aws_security_group_rule" "sg-internet-e" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-internet.id
}