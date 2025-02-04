#### Private Hosted Zone ####

resource "aws_route53_zone" "pri-zone-juggorr-int-cloudconsulting-me" {
  name = "juggorr-int.cloudconsulting.me"

  vpc {
    vpc_id = aws_vpc.vpc-juggorr-share.id
  }

  # vpc {
  #   vpc_id = aws_vpc.vpc-juggorr-prod.id
  # }
}

#### Route53 Records for juggorr-int.cloudconsulting.me ####

resource "aws_route53_record" "weblb-juggorr-int-cloudconsulting-me" {
  zone_id = aws_route53_zone.pri-zone-juggorr-int-cloudconsulting-me.id
  name = "weblb.juggorr-int.cloudconsulting.me"
  type = "A"

  alias {
    name = aws_lb.alb-juggorr-prod-web.dns_name
    zone_id = aws_lb.alb-juggorr-prod-web.zone_id
    evaluate_target_health = true
  }
}