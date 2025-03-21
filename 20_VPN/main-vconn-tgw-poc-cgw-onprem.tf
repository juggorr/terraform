resource "aws_vpn_connection" "vconn-tgw-poc-cgw-onprem" {
  customer_gateway_id = aws_customer_gateway.cgw-onprem.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw-poc.id
  type = "ipsec.1"

  tunnel1_inside_cidr = var.vconn-tgw-poc-cgw-onprem-tunnel-1-cidr
  tunnel2_inside_cidr = var.vconn-tgw-poc-cgw-onprem-tunnel-2-cidr
  tunnel1_preshared_key = var.vconn-tunnels-shared-secret-for-azure
  tunnel2_preshared_key = var.vconn-tunnels-shared-secret-for-azure
  tunnel1_ike_versions = ["ikev2"]
  tunnel2_ike_versions = ["ikev2"]
  tunnel1_phase1_dh_group_numbers = ["14"]
  tunnel2_phase1_dh_group_numbers = ["14"]
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms = ["SHA2-256"]
  tunnel2_phase1_integrity_algorithms = ["SHA2-256"]
  tunnel1_phase1_lifetime_seconds = 28800
  tunnel2_phase1_lifetime_seconds = 28800
  tunnel1_phase2_dh_group_numbers = ["14"]
  tunnel2_phase2_dh_group_numbers = ["14"]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_integrity_algorithms = ["SHA2-256"]
  tunnel2_phase2_integrity_algorithms = ["SHA2-256"]
  tunnel1_phase2_lifetime_seconds = 3600
  tunnel2_phase2_lifetime_seconds = 3600

  tags = {
    Namse = "vconn-tgw-poc-cgw-onprem"
  }
}