resource "aws_security_group" "sg-juggorr-share-ssh" {
  name = "SG-juggorr-SHARE-SSH"
  description = "SG for ssh vpc"
  vpc_id = aws_vpc.vpc-juggorr-share.id

  tags = {
    Name = "SG-juggorr-SHARE-SSH"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-ssh-i00" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["10.151.7.64/27"]
  security_group_id = aws_security_group.sg-juggorr-share-ssh.id
}