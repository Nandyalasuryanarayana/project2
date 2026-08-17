# This file contains input variable values for Terraform configuration.
# Use this file to specify values for variables defined in your Terraform files.

region                       = "ap-south-1"
environment_name             = "project_1"
vpc_cidr_block               = "192.168.0.0/16"
pub_subnet_az1_cidr          = "192.168.0.0/24"
pub_subnet_az2_cidr          = "192.168.1.0/24"
private_app_subnet_az1_cidr  = "192.168.2.0/24"
private_app_subnet_az2_cidr  = "192.168.3.0/24"
private_data_subnet_az1_cidr = "192.168.4.0/24"
private_data_subnet_az2_cidr = "192.168.5.0/24"

private_eks_master_components_subnet_az1_cidr = "192.169.6.0/24"
private_eks_master_components_subnet_az2_cidr = "192.169.7.0/24"
vpc_name                                      = "project_1_vpc"
create_eks_master_components_subnets          = false
