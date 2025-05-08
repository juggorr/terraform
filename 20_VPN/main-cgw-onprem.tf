resource "aws_customer_gateway" "cgw-onprem" {
  device_name = "cgw-onprem"
  bgp_asn = var.cgw-onprem-bgp-asn
  ip_address = var.cgw-onprem-ip
  type = "ipsec.1"

  tags = {
    Name = "cgw-onprem"
  }
}