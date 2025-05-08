resource "aws_instance" "ec2-internet" {
  ami = var.ec2-ami
  instance_type = "t3.nano"
  key_name = "eks-practice"
  subnet_id = aws_subnet.sbn-internet-1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg-ec2-ssh.id]

  tags = {
    Name = "ec2-internet"
  }
}

output "ec2_public_ip" {
 value = aws_instance.ec2-internet.public_ip
}