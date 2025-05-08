resource "aws_eip" "eip-juggorr-share-utm" {
  vpc = true
  network_interface = aws_network_interface.eni-juggorr-share-external.id

  tags = {
    Name = "EIP-juggorr-SHARE-UTM"
  }
}

# resource "aws_eip_association" "eip-juggorr-share-utm-1" {
#   network_interface_id = data.aws_network_interface.eni-juggorr-share-public.id
#   allocation_id = data.aws_eip.eip-juggorr-share-utm.id
# }