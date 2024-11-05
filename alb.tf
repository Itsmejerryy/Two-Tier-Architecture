resource "aws_lb" "ec2-lb" {
  name               = "ec2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls_alb.id]
  subnets            = [aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id]


  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ec2-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2-alb-tg.arn
  }
}

