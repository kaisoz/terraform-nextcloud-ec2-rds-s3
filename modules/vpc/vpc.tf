
resource "aws_vpc" "nextcloud_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Nextcloud app VPC"
  }
}

# Public subnet
resource "aws_subnet" "nextcloud_app_subnet" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.public_subnet_cidr
  # TODO: Make it dynamic
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Nextcloud app public subnet"
  }
}

# Private subnet
resource "aws_subnet" "nextcloud_db_subnet" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Nextcloud db private subnet"
  }
}

resource "aws_db_subnet_group" "nextcloud_db_subnet_grp" {
  name       = "nextcloud db subnet group"
  subnet_ids = [aws_subnet.nextcloud_app_subnet.id, aws_subnet.nextcloud_db_subnet.id]

  tags = {
    Name = "Nextcloud db subnet group"
  }
}

# Internet gateway
resource "aws_internet_gateway" "nextcloud_vpc_igw" {
  vpc_id = aws_vpc.nextcloud_vpc.id

  tags = {
    Name = "Nextcloud internet gateway"
  }
}

# Route table
resource "aws_route_table" "nextcloud_rt" {
  vpc_id = aws_vpc.nextcloud_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nextcloud_vpc_igw.id
  }

  tags = {
    Name = "Nextcloud route table"
  }
}

# Assign the route table to the public subnet
resource "aws_route_table_association" "nextcloud_rt_assoc" {
  subnet_id = aws_subnet.nextcloud_app_subnet.id
  route_table_id = aws_route_table.nextcloud_rt.id
}