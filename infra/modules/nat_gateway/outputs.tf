# Outputs.tf file for Terraform
# This file defines output variables for the infrastructure created using Terraform
# Each output variable corresponds to a specific input variable provided in the variables.tf file
#=================================================================================================#
output "region" {
  value = var.region
}

output "vpc_name" {
  value = var.vpc_name
}

output "pub_subnet_az1_name" {
  value = var.pub_subnet_az1_name
}

output "pub_subnet_az2_name" {
  value = var.pub_subnet_az2_name
}

output "app_subnet_az1_name" {
  value = var.app_subnet_az1_name
}

output "app_subnet_az2_name" {
  value = var.app_subnet_az2_name
}

output "data_subnet_az1_name" {
  value = var.data_subnet_az1_name
}

output "data_subnet_az2_name" {
  value = var.data_subnet_az2_name
}

output "igw_name" {
  value = var.igw_name
}

output "nat_gateway_az1_name" {
  value = var.nat_gateway_az1_name
}

output "nat_gateway_az2_name" {
  value = var.nat_gateway_az2_name
}

output "nat_gateway_eip_az1_name" {
  value = var.nat_gateway_eip_az1_name
}

output "nat_gateway_eip_az2_name" {
  value = var.nat_gateway_eip_az2_name
}

output "private_route_table_az1_name" {
  value = var.private_route_table_az1_name
}

output "private_route_table_az2_name" {
  value = var.private_route_table_az2_name
}

output "eks_master_components_subnet_az1" {
  value = var.eks_master_components_subnet_az1
}

output "eks_master_components_subnet_az2" {
  value = var.eks_master_components_subnet_az2
}

output "eks_master_components_subnets_route_table_association" {
  value = var.eks_master_components_subnets_route_table_association
}
