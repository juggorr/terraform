### 과제2에서 추가
resource "aws_instance" "ec2-juggorr-share-svr" {
  ami = var.utm-ec2-ami
  instance_type = "t3.nano"
  key_name = "juggorr2"
  availability_zone = data.aws_availability_zones.all.names[2]
  subnet_id = aws_subnet.sbn-juggorr-share-private2.id
  vpc_security_group_ids = [aws_security_group.sg-juggorr-share-ssh.id]
  private_ip = var.ec2-juggorr-share-svr-eni-ip

  root_block_device {
    volume_type = "gp3"
    volume_size = "50"
  }

  tags = {
    Name = "EC2-juggorr-SHARE-SVR"
  }
}