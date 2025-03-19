resource "aws_security_group" "sg-juggorr-prod-ssh" {
  name = "SG-juggorr-PROD-SSH"
  description = "SG for ssh vpc"
  vpc_id = aws_vpc.vpc-juggorr-prod.id

  tags = {
    Name = "SG-juggorr-PROD-SSH"
  }
}

resource "aws_security_group_rule" "sg-juggorr-prod-ssh-i00" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["10.151.7.64/27"]
  security_group_id = aws_security_group.sg-juggorr-prod-ssh.id
}