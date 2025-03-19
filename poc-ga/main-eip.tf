resource "aws_eip" "eip-internet" {
  vpc = "true"
  instance = aws_instance.svr-internet.id

  tags = {
    Name = "eip-internet"
  }
}