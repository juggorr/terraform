#### Route53 Public Hosted Zone ####

resource "aws_route53_zone" "pub-zone-juggorr-cloudconsulting-me" {
  name = "juggorr.cloudconsulting.me"

}

output "name-servers-pub-zone-juggorr-cloudconsulting-me" {
  value = aws_route53_zone.pub-zone-juggorr-cloudconsulting-me.name_servers
}

#### Route53 Records for juggorr.cloudconsulting.me ####

resource "aws_route53_record" "www-juggorr-cloudconsulting-me" {
  zone_id = aws_route53_zone.pub-zone-juggorr-cloudconsulting-me.id
  name = "www.juggorr.cloudconsulting.me"
  type = "A"

  alias {
    name = aws_lb.alb-juggorr-share-waf-external.dns_name
    zone_id = aws_lb.alb-juggorr-share-waf-external.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "acm-www-juggorr-cloudconsulting-me" {
  for_each = {
    for dvo in aws_acm_certificate.cert-www-juggorr-cloudconsulting-me.domain_validation_options : dvo.domain_name => {
      name = dvo.resource_record_name
      record = dvo.resource_record_value
      type = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name = each.value.name
  records = [each.value.record]
  ttl = 60
  type = each.value.type
  zone_id = aws_route53_zone.pub-zone-juggorr-cloudconsulting-me.zone_id
}