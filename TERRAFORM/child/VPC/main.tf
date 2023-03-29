##### VPC 
resource "aws_vpc" "MyVPC" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "MyVPC"
  }
}

##### AWS Subnets
resource "aws_subnet" "public-subnet" {
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.MyVPC.id
  tags = {
    "Name" = "PublicSubnet"
  }
}

##### AWS Subnets
resource "aws_subnet" "private-subnet" {
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.MyVPC.id
  tags = {
    "Name" = "PrivateSubnet"
  }
}

##### Internet Gateway
resource "aws_internet_gateway" "MyIG" {
  vpc_id = aws_vpc.MyVPC.id
  tags = {
    "Name" = "MyIG"
  }
}

##### Security Group 
resource "aws_security_group" "MySG" {
  name   = "MySG"
  vpc_id = aws_vpc.MyVPC.id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySG"
  }
}

## Route Table
resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.MyVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyIG.id
  }
  tags = {
    "Name" = "PublicRouteTable"
  }
}

## Route Table ASS
resource "aws_route_table_association" "PublicRouteTable_ASS" {
 route_table_id = aws_route_table.PublicRouteTable.id
 subnet_id = aws_subnet.public-subnet.id
}

