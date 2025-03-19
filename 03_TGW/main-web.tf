# WEB SVR
resource "aws_instance" "ec2-juggorr-prod-web" {
  ami = var.utm-ec2-ami
  instance_type = "t3.nano"
  key_name = "juggorr"
  availability_zone = data.aws_availability_zones.all.names[2]

  tags = {
    Name = "EC2-juggorr-PROD-WEB"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-juggorr-prod-web.id
    device_index = 0
  }
}

resource "aws_network_interface" "eni-juggorr-prod-web" {
  subnet_id = aws_subnet.sbn-juggorr-prod-private2.id
  private_ips = [var.web-ec2-eni-ip]
  security_groups = [aws_security_group.sg-juggorr-prod-ssh.id, aws_security_group.sg-juggorr-prod-web.id]

  tags = {
    Name = "ENI-juggorr-PROD-WEB"
  }
}