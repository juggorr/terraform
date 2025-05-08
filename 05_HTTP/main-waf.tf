# WAF SVR
resource "aws_instance" "ec2-juggorr-share-waf" {
  ami = var.web-ec2-ami
  instance_type = "t3.nano"
  key_name = "juggorr"
  availability_zone = data.aws_availability_zones.all.names[2]

  tags = {
    Name = "EC2-juggorr-SHARE-WAF"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-juggorr-share-waf.id
    device_index = 0
  }
}

resource "aws_network_interface" "eni-juggorr-share-waf" {
  subnet_id = aws_subnet.sbn-juggorr-share-private2.id
  private_ips = [var.waf-ec2-eni-ip]
  security_groups = [aws_security_group.sg-juggorr-share-ssh.id, aws_security_group.sg-juggorr-share-waf.id]

  tags = {
    Name = "ENI-juggorr-SHARE-WAF"
  }
}