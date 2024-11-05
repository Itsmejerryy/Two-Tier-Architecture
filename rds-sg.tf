resource "aws_security_group" "db-sg" {
  name        = "rds-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.two-tier-vpc.id

  tags = {
    Name = "allow_tls_alb"
  }
}

#inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow_http_rds" {
  security_group_id = aws_security_group.db-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
  description       = "allow traffic from ec2"
}

#outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_rds" {
  security_group_id = aws_security_group.db-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}