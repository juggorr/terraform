#### ACM ####

resource "aws_acm_certificate" "cert-www-juggorr-cloudconsulting-me" {
  domain_name = "www.juggorr.cloudconsulting.me"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "validate-cert-www-juggorr-cloudconsulting-me" {
  certificate_arn = aws_acm_certificate.cert-www-juggorr-cloudconsulting-me.arn
  validation_record_fqdns = [for record in aws_route53_record.acm-www-juggorr-cloudconsulting-me : record.fqdn]
}