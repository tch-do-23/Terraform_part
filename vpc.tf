### This code includes creation of vpc, subnets, internet gateway and route table
##VPC
resource "aws_vpc" "final_project_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = " final_project_vpc"
  }
}

#Public subnets

resource "aws_subnet" "tf_subnet_1" {
  vpc_id            = aws_vpc.final_project_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf_subnet_1"
  }
}

resource "aws_subnet" "tf_subnet_2" {
  vpc_id            = aws_vpc.final_project_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf_subnet_2"
  }
}

#internet gateway
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.final_project_vpc.id

  tags = {
    Name = "tf-igw"
  }
}
# Route Table
resource "aws_route_table" "tf-rt" {
  vpc_id = aws_vpc.final_project_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
  tags = {
    Name = "tf-rt"
  }
}
resource "aws_route_table_association" "tf_subnet_1" {
  subnet_id      = aws_subnet.tf_subnet_1.id
  route_table_id = aws_route_table.tf-rt.id
}

resource "aws_route_table_association" "tf_subnet_2" {
  subnet_id      = aws_subnet.tf_subnet_2.id
  route_table_id = aws_route_table.tf-rt.id
}
