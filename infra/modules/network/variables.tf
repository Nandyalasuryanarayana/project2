# variables.tf file
# This file defines the input variables for the Terraform configuration
# These variables will be used to create the infrastructure

variable "region" {}
variable "environment_name" {}
variable "vpc_cidr_block" {}
variable "pub_subnet_az1_cidr" {}
variable "pub_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}
variable "private_eks_master_components_subnet_az1_cidr" {}
variable "private_eks_master_components_subnet_az2_cidr" {}
variable "create_eks_master_components_subnets" {
  type = bool
}
# variable "destination" {}
# variable "vpc_peering_connection_id" {}
