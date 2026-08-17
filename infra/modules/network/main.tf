# main.tf file for Terraform module
# This file contains the main configuration for the Terraform module
#===================================================================================================#

# create vpc for project_1 
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment_name}_vpc"
  }
}

# create internet gateway and attach it to dev env vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment_name}_igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create dev env public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment_name}_public_subnet_az1"
  }
}

# create dev env public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment_name}_public_subnet_az2"
  }
}

# create dev env route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  # route {
  #   cidr_block = var.destination
  #   vpc_peering_connection_id = var.vpc_peering_connection_id
  # }

  tags = {
    Name = "${var.environment_name}_public_route_table"
  }
}

# Associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# create elastic ip for nat gateway
resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.environment_name}_nat_gateway_eip"
  }
}

# create nat gateway in public subnet az1
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.environment_name}_nat_gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

# create private route table and route traffic through nat gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.environment_name}_private_route_table"
  }
}

# associate private app subnet az1 to private route table
resource "aws_route_table_association" "private_app_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

# associate private app subnet az2 to private route table
resource "aws_route_table_association" "private_app_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}

# associate private data subnet az1 to private route table
resource "aws_route_table_association" "private_data_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

# associate private data subnet az2 to private route table
resource "aws_route_table_association" "private_data_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}

# create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_app_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_private_app_subnet_az1"
  }
}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_app_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_private_app_subnet_az2"
  }
}

# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_data_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_private_data_subnet_az1"
  }
}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_data_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_private_data_subnet_az2"
  }
}

# create private k8s master_components subnet az1
resource "aws_subnet" "eks_master_components_subnet_az1" {
  count                   = var.create_eks_master_components_subnets ? 1 : 0
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_eks_master_components_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_eks_master_components_subnet_az1"
  }
}

# create private k8s master_components subnet az2
resource "aws_subnet" "eks_master_components_subnet_az2" {
  count                   = var.create_eks_master_components_subnets ? 1 : 0
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_eks_master_components_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment_name}_eks_master_components_subnet_az2"
  }
}
