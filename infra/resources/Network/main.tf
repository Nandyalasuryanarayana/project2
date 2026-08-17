# main.tf file for Terraform module
# This file contains the main configuration for the Terraform module
#===================================================================================================#

# Configure aws provider
provider "aws" {
  region  = var.region
  #profile = "devops" #The "devops" is an IAM user created to authenticate the terraform"
}
# Create vpc
module "vpc" {
  source                                        = "../../modules/network"
  region                                        = var.region
  environment_name                              = var.environment_name
  vpc_cidr_block                                = var.vpc_cidr_block
  pub_subnet_az1_cidr                           = var.pub_subnet_az1_cidr
  pub_subnet_az2_cidr                           = var.pub_subnet_az2_cidr
  private_app_subnet_az1_cidr                   = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr                   = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr                  = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr                  = var.private_data_subnet_az2_cidr
  create_eks_master_components_subnets          = var.create_eks_master_components_subnets
  private_eks_master_components_subnet_az1_cidr = var.private_eks_master_components_subnet_az1_cidr
  private_eks_master_components_subnet_az2_cidr = var.private_eks_master_components_subnet_az2_cidr
  # destination = var.destination
  # vpc_peering_connection_id = var.vpc_peering_connection_id
  # Network rename to network

}
