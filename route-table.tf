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

resource "aws_route_table_association" "rta-az1" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public-rtb.id
}

resource "aws_route_table_association" "rta-az2" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public-rtb.id
}