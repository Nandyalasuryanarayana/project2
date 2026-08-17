# variables.tf file
# This file defines the input variables for the Terraform configuration
# These variables will be used to create the infrastructure

variable "region" {}
variable "vpc_name" {}
variable "pub_subnet_az1_name" {}
variable "pub_subnet_az2_name" {}
#variable "pub_subnet_az1_environment" {}
#variable "pub_subnet_az2_environment" {}

variable "app_subnet_az1_name" {}
variable "app_subnet_az2_name" {}
#variable "app_subnet_az1_environment" {}
#variable "app_subnet_az2_environment" {}

variable "data_subnet_az1_name" {}
variable "data_subnet_az2_name" {}
#variable "data_subnet_az1_environment" {}
#variable "data_subnet_az2_environment" {}

variable "igw_name" {}

variable "nat_gateway_az1_name" {}
variable "nat_gateway_az2_name" {}
variable "nat_gateway_eip_az1_name" {}
variable "nat_gateway_eip_az2_name" {}

variable "private_route_table_az1_name" {}
variable "private_route_table_az2_name" {}
variable "eks_master_components_subnet_az1" {}
variable "eks_master_components_subnet_az2" {}
variable "eks_master_components_subnets_route_table_association" {
  type = bool
}
