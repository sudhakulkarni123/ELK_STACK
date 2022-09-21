resource "aws_vpc" "elk_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "elk_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_public
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private_a
  availability_zone = "eu-west-1a"
   

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private_b
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private_b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.elk_vpc.id
  cidr_block = var.cidr_private_c
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private_c"
  }
}

resource "aws_internet_gateway" "internet_gateways" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "internet_gateways"
  }
}

resource "aws_eip" "nat_eips" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}
