resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.two-tier-vpc.id
  tags = {
    Name = "Public Subnets"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
