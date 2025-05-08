#### ALB ####

# WAF ALB
resource "aws_lb" "alb-juggorr-share-waf-external" {
  name = "ALB-juggorr-SHARE-WAF-EXTERNAL"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sg-juggorr-share-alb-waf-external.id]
  subnets = [aws_subnet.sbn-juggorr-share-public1.id, aws_subnet.sbn-juggorr-share-public2.id]

  enable_deletion_protection = false # 실제환경에서는 enable
  idle_timeout = 60
  enable_http2 = true # Internet-facing ALB에서는 HTTP2 활성화

  tags = {
    Env = "share"
  }
}

resource "aws_lb_listener" "alb-jugorr-share-waf-external-80" {
  load_balancer_arn = aws_lb.alb-juggorr-share-waf-external.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg-juggorr-share-waf-external.arn
  }
}

# WEB ALB
resource "aws_lb" "alb-juggorr-prod-web" {
  name = "ALB-juggorr-PROD-WEB"
  internal = true
  load_balancer_type = "application"
  security_groups = [aws_security_group.sg-juggorr-prod-alb-web.id]
  subnets = [aws_subnet.sbn-juggorr-prod-private3.id, aws_subnet.sbn-juggorr-prod-private4.id]

  enable_deletion_protection = false
  idle_timeout = 60
  enable_http2 = false
  
  tags = {
    Env = "prod"
  }
}

resource "aws_lb_listener" "alb-juggorr-prod-web-80" {
  load_balancer_arn = aws_lb.alb-juggorr-prod-web.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg-juggorr-prod-web.arn
  }
}