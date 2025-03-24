resource "aws_security_group" "sg-ec2-ssh" {
  name = "SG-ec2-SSH"
  description = "SG for ssh ec2"
  vpc_id = aws_vpc.vpc-internet.id

  tags = {
    Name = "SG-ec2-SSH"
  }
}

resource "aws_security_group_rule" "sg-ec2-ssh-i00" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-ec2-ssh.id
}

resource "aws_security_group_rule" "sg-ec2-ssh-i01" {
  type = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-ec2-ssh.id
}

resource "aws_security_group_rule" "sg-ec2-ssh-e00" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-ec2-ssh.id
}