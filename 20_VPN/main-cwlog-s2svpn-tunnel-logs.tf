resource "aws_cloudwatch_log_group" "cwlog-s2svpn-tunnel-logs" {
  name = "cwlog-s2svpn-tunnel-logs"
  retention_in_days = 3

  lifecycle {
    ignore_changes = [retention_in_days]
  }

  tags = {
    Name = "cwlog-s2svpn-tunnel-logs"
  }
}