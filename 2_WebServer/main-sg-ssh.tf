### 과제2에서 추가
resource "aws_security_group" "sg-juggorr-share-ssh" {
  name = "SG juggorr SHARE SSH"
  vpc_id = aws_vpc.vpc-juggorr-share.id
  description = "Bastion Host"

  tags = {
    Name = "SG-juggorr-SHARE-SSH"
  }
}

resource "aws_security_group_rule" "sg-juggorr-share-ssh-i" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  #source_security_group_id = aws_security_group.sg-juggorr-share-utm-external.id
  source_security_group_id = aws_security_group.sg-juggorr-share-utm-internal.id
  security_group_id = aws_security_group.sg-juggorr-share-ssh.id
}

resource "aws_security_group_rule" "sg-juggorr-share-ssh-e" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-juggorr-share-ssh.id
}