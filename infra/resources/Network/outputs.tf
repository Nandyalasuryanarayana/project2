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

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "pub_subnet_az1_cidr" {
  value = var.pub_subnet_az1_cidr
}

output "pub_subnet_az2_cidr" {
  value = var.pub_subnet_az2_cidr
}

output "private_app_subnet_az1_cidr" {
  value = var.private_app_subnet_az1_cidr
}

output "private_app_subnet_az2_cidr" {
  value = var.private_app_subnet_az2_cidr
}

output "private_data_subnet_az1_cidr" {
  value = var.private_data_subnet_az1_cidr
}

output "private_data_subnet_az2_cidr" {
  value = var.private_data_subnet_az2_cidr
}
