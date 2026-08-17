# Outputs.tf file for Terraform
# This file defines output variables for the infrastructure created using Terraform
# Each output variable corresponds to a specific input variable provided in the variables.tf file
#=================================================================================================#

output "region" {
  value = var.region
}

output "environment_name" {
  value = var.environment_name
}

output "vpc" {
  value = aws_vpc.vpc.id
}

output "public_subnet_az1" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_app_subnet_az1" {
  value = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2" {
  value = aws_subnet.private_app_subnet_az2.id
}

output "private_data_subnet_az1" {
  value = aws_subnet.private_data_subnet_az1.id
}

output "private_data_subnet_az2" {
  value = aws_subnet.private_data_subnet_az2.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
}
