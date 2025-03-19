resource "aws_instance" "svr-internet" {
  ami = var.svr-ami
  instance_type = "t3.medium"
  key_name = "westcoast"
  subnet_id = aws_subnet.sbn-internet.id
  availability_zone = data.aws_availability_zones.all.names["${var.az-1-number}"]
  vpc_security_group_ids = [aws_security_group.sg-internet.id]

  tags = {
    Name = "svr-internet"
  }
}