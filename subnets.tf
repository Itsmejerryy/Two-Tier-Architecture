# Availability Zone: us-east-1a
resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = aws_vpc.two-tier-vpc.id
  availability_zone = var.az-1
  cidr_block        = var.pub-cidr-az-1
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.two-tier-vpc.id
  availability_zone = var.az-1
  cidr_block        = var.priv-cidr-az-1
}

# Availability Zone: us-east-1b
resource "aws_subnet" "public-subnet-1b" {
  vpc_id            = aws_vpc.two-tier-vpc.id
  availability_zone = var.az-2
  cidr_block        = var.pub-cidr-az-2
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.two-tier-vpc.id
  availability_zone = var.az-2
  cidr_block        = var.priv-cidr-az-2
}
