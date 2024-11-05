resource "aws_instance" "ec2_subnet_a" {
  key_name = var.key_name
  ami             = var.ec2-config.ami
  instance_type   = var.ec2-config.instance-type
  subnet_id       = aws_subnet.public-subnet-1a.id
  security_groups = [aws_security_group.allow_tls_ec2.id]
  user_data       = filebase64(var.ec2-config.user_data)
  associate_public_ip_address = true
}


resource "aws_instance" "ec2_subnet_b" {
  key_name = var.key_name
  ami             = var.ec2-config.ami
  instance_type   = var.ec2-config.instance-type
  subnet_id       = aws_subnet.public-subnet-1b.id
  security_groups = [aws_security_group.allow_tls_ec2.id]
  user_data       = filebase64(var.ec2-config.user_data)
  associate_public_ip_address = true
}