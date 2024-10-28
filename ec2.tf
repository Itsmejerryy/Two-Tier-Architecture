resource "aws_instance" "ec2_subnet_a" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet-1a.id
    vpc_security_group_ids = [aws_security_group.allow_tls_ec2.id]
    associate_public_ip_address = true
    user_data = filebase64("user_data.sh")

}


# resource "aws_instance" "ec2_subnet_b" {
  
# }