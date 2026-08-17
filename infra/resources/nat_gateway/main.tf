provider "aws" {
  region  = var.region
  
}
# Create nat gateway
module "nat_gateway" {
  source   = "../../modules/nat_gateway"
  region   = var.region
  vpc_name = var.vpc_name

  pub_subnet_az1_name = var.pub_subnet_az1_name
  pub_subnet_az2_name = var.pub_subnet_az2_name
 

  app_subnet_az1_name = var.app_subnet_az1_name
  app_subnet_az2_name = var.app_subnet_az2_name
  

  data_subnet_az1_name = var.data_subnet_az1_name
  data_subnet_az2_name = var.data_subnet_az2_name
 

  igw_name             = var.igw_name
  nat_gateway_az1_name = var.nat_gateway_az1_name
  nat_gateway_az2_name = var.nat_gateway_az2_name

  nat_gateway_eip_az1_name                              = var.nat_gateway_eip_az1_name
  nat_gateway_eip_az2_name                              = var.nat_gateway_eip_az2_name
  private_route_table_az1_name                          = var.private_route_table_az1_name
  private_route_table_az2_name                          = var.private_route_table_az2_name
  eks_master_components_subnet_az1                      = var.eks_master_components_subnet_az1
  eks_master_components_subnet_az2                      = var.eks_master_components_subnet_az2
  eks_master_components_subnets_route_table_association = var.eks_master_components_subnets_route_table_association

}
