# main.tf file for Terraform module
# This file contains the main configuration for the Terraform module
#===================================================================================================#

# Using datasource to fetch the specific VPC with specific tags
data "aws_vpcs" "specific_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Select public subnets in az1 with specific tags
data "aws_subnets" "public_subnets_az1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}a"]
  # }

  tags = {
    Name = var.pub_subnet_az1_name
    # Environment = var.pub_subnet_az1_environment
    # Type        = "public"
  }
}

# Select public subnets in az2 with specific tags
data "aws_subnets" "public_subnets_az2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}b"]
  # }

  tags = {
    Name = var.pub_subnet_az2_name
    # Environment = var.pub_subnet_az2_environment
    # Type        = "public"
  }
}

# Select private_app subnets in az1 with specific tags
data "aws_subnets" "app_subnets_az1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}a"]
  # }

  tags = {
    Name = var.app_subnet_az1_name
    # Environment = var.app_subnet_az1_environment
    # Type        = "private"
  }
}

# Select private_app subnets in az2 with specific tags
data "aws_subnets" "app_subnets_az2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}a"]
  # }

  tags = {
    Name = var.app_subnet_az2_name
    # Environment = var.app_subnet_az2_environment
    # Type        = "public"
  }
}

# Select private_data subnets in az1 with specific tags
data "aws_subnets" "data_subnets_az1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}a"]
  # }

  tags = {
    Name = var.data_subnet_az1_name
    # Environment = var.data_subnet_az1_environment
    # Type        = "private"
  }
}

# Select private_data subnets in az2 with specific tags
data "aws_subnets" "data_subnets_az2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }

  # filter {
  #   name   = "availability-zone"
  #   values = ["${var.region}a"]
  # }

  tags = {
    Name = var.data_subnet_az2_name
    # Environment = var.data_subnet_az2_environment
    # Type        = "public"
  }
}
# Select eks mater components subnets in az1 with specific tags
data "aws_subnets" "eks_master_components_subnets_az1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }
  tags = {
    Name = var.eks_master_components_subnet_az1
  }
}
# Select eks mater components subnets in az1 with specific tags
data "aws_subnets" "eks_master_components_subnets_az2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.specific_vpc.ids[0]]
  }
  tags = {
    Name = var.eks_master_components_subnet_az2
  }
}
# Select Internet Gateway with specific tag
data "aws_internet_gateway" "specific_igw" {
  filter {
    name   = "tag:Name"
    values = [var.igw_name]
  }
}
# Allocate elastic IPs for NAT gateways in each AZ for the selected VPC
resource "aws_eip" "eip_for_nat_gateway_az1" {
  domain = "vpc"

  tags = {
    Name = var.nat_gateway_eip_az1_name
  }
}
resource "aws_eip" "eip_for_nat_gateway_az2" {
  domain = "vpc"

  tags = {
    Name = var.nat_gateway_eip_az2_name
  }
}

# Create NAT Gateway in public subnet AZ1
resource "aws_nat_gateway" "nat_gateway_az1" {

  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = data.aws_subnets.public_subnets_az1.ids[0]

  tags = {
    Name = var.nat_gateway_az1_name
  }

  depends_on = [data.aws_internet_gateway.specific_igw]
}

# Create NAT Gateway in public subnet AZ2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = data.aws_subnets.public_subnets_az2.ids[0]

  tags = {
    Name = var.nat_gateway_az2_name
  }

  depends_on = [data.aws_internet_gateway.specific_igw]
}

# Create private route table for NAT Gateway in public subnet AZ1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = data.aws_vpcs.specific_vpc.ids[0]

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = var.private_route_table_az1_name
  }
}

# Create private route table for NAT Gateway in public subnet AZ2
resource "aws_route_table" "private_route_table_az2" {

  vpc_id = data.aws_vpcs.specific_vpc.ids[0]

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = var.private_route_table_az2_name
  }
}
#Associate private app subnet az1 with private route table az1
resource "aws_route_table_association" "private_app_subnet_az1_route_table_az1_association" {

  subnet_id      = data.aws_subnets.app_subnets_az1.ids[0]
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate private data subnet az1 with private route table az1
resource "aws_route_table_association" "private_data_subnet_az1_route_table_az1_association" {

  subnet_id      = data.aws_subnets.data_subnets_az1.ids[0]
  route_table_id = aws_route_table.private_route_table_az1.id
}


# Associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_route_table_az2_association" {

  subnet_id      = data.aws_subnets.app_subnets_az2.ids[0]
  route_table_id = aws_route_table.private_route_table_az2.id
}


# Associate private data subnet az2 with private route table az2
resource "aws_route_table_association" "private_data_subnet_az2_route_table_az2_association" {
  subnet_id      = data.aws_subnets.data_subnets_az2.ids[0]
  route_table_id = aws_route_table.private_route_table_az2.id
}

#Associate eks master components subnet az1 with private route table az1
resource "aws_route_table_association" "eks_master_components_subnet_az1_route_table_az1_association" {

  count          = var.eks_master_components_subnets_route_table_association ? 1 : 0
  subnet_id      = data.aws_subnets.eks_master_components_subnets_az1.ids[0]
  route_table_id = aws_route_table.private_route_table_az1.id
}
# Associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "eks_master_components_subnet_az2_route_table_az2_association" {

  count          = var.eks_master_components_subnets_route_table_association ? 1 : 0
  subnet_id      = data.aws_subnets.eks_master_components_subnets_az2.ids[0]
  route_table_id = aws_route_table.private_route_table_az2.id
}
