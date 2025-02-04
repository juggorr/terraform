resource "aws_instance" "ec2-juggorr-share-utm" {
  ami = var.utm-ec2-ami
  instance_type = "t3.nano"
  key_name = "juggorr2"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "EC2-juggorr-SHARE-UTM"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-juggorr-share-external.id
    device_index = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-juggorr-share-internal.id
    device_index = 1
  }
}

resource "aws_network_interface" "eni-juggorr-share-external" {
  subnet_id = aws_subnet.sbn-juggorr-share-public1.id
  private_ips = [var.utm-ec2-public-eni-ip]
  security_groups = [aws_security_group.sg-juggorr-share-utm-external.id]
  
  tags = {
    Name = "ENI-juggorr-SHARE-EXTERNAL"
  }
}

resource "aws_network_interface" "eni-juggorr-share-internal" {
  subnet_id = aws_subnet.sbn-juggorr-share-private1.id
  private_ips = [var.utm-ec2-private-eni-ip]
  security_groups = [aws_security_group.sg-juggorr-share-utm-internal.id]
  source_dest_check = false

  tags = {
    Name = "ENI-juggorr-SHARE-INTERNAL"
  }
}