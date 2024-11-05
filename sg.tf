resource "aws_security_group" "allow_tls_ec2" {
  name        = "ec2-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.two-tier-vpc.id

  tags = {
    Name = "allow_tls_ec2"
  }
}

#inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow_http_ec2" {
  security_group_id = aws_security_group.allow_tls_ec2.id #alb-ec2-http
  referenced_security_group_id = aws_security_group.allow_tls_alb.id
  # cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "allow HTTP from ALB"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ec2" {
  security_group_id = aws_security_group.allow_tls_ec2.id #alb-ec2-ssh
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "allow SSH from ALB"
}

#outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_ec2" {
  security_group_id = aws_security_group.allow_tls_ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# resource "aws_vpc_security_group_egress_rule" "allow_traffic_rds" {
#   security_group_id = aws_security_group.allow_tls_ec2.id #ec2 to rds
#   from_port         = 3306
#   ip_protocol       = "tcp"
#   to_port           = 3306
#   cidr_ipv4         = "0.0.0.0/0"
#   description       = "allow traffic to RDS"
# }