#### Target Group ####

resource "aws_lb_target_group" "tg-juggorr-share-waf-external" {
  name = "TG-juggorr-SHARE-WAF-EXTERNAL"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc-juggorr-share.id
  deregistration_delay = 1
  load_balancing_algorithm_type = "round_robin"

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 3
    timeout = 4
    interval = 5
    path = "/hc"    
    matcher = "200"
    port = "traffic-port"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "tg-juggorr-prod-web" {
  name = "TG-juggorr-PROD-WEB"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc-juggorr-prod.id
  deregistration_delay = 1
  load_balancing_algorithm_type = "round_robin"

    health_check {
    healthy_threshold = 2
    unhealthy_threshold = 3
    timeout = 4
    interval = 5
    path = "/"    
    matcher = "200"
    port = "traffic-port"
    protocol = "HTTP"
  }
}

#### Target Group Association ####
resource "aws_lb_target_group_attachment" "tga-juggorr-share-waf-external" {
  target_group_arn = aws_lb_target_group.tg-juggorr-share-waf-external.arn
  target_id = aws_instance.ec2-juggorr-share-waf.id
  port = 80
}

resource "aws_lb_target_group_attachment" "tga-juggorr-prod-web" {
  target_group_arn = aws_lb_target_group.tg-juggorr-prod-web.arn
  target_id = aws_instance.ec2-juggorr-prod-web.id
  port = 80
}