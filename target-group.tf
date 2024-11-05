resource "aws_lb_target_group" "ec2-alb-tg" {
  name     = "ec2-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.two-tier-vpc.id

  tags = {
    Target-Type = "Instances"
  }
}

resource "aws_lb_target_group_attachment" "tg-attachment-1" {
  target_group_arn = aws_lb_target_group.ec2-alb-tg.id
  target_id        = aws_instance.ec2_subnet_a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment-2" {
  target_group_arn = aws_lb_target_group.ec2-alb-tg.id
  target_id        = aws_instance.ec2_subnet_b.id
  port             = 80
}