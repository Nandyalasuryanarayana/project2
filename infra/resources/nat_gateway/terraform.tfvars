region   = "ap-south-1"
vpc_name = "project_1_vpc"

pub_subnet_az1_name = "project_1_public_subnet_az1"
pub_subnet_az2_name = "project_1_public_subnet_az2"

app_subnet_az1_name = "project_1_private_app_subnet_az1"
app_subnet_az2_name = "project_1_private_app_subnet_az2"

data_subnet_az1_name = "project_1_private_data_subnet_az1"
data_subnet_az2_name = "project_1_private_data_subnet_az2"

igw_name = "project_1_igw"

nat_gateway_az1_name     = "project_1_nat_gateway_az1"
nat_gateway_az2_name     = "project_1_nat_gateway_az2"
nat_gateway_eip_az1_name = "project_1_nat_gateway_eip_az1"
nat_gateway_eip_az2_name = "project_1_nat_gateway_eip_az2"

private_route_table_az1_name = "project_1_private_route_table_az1"
private_route_table_az2_name = "project_1_private_route_table_az2"

# EKS master components subnets - not used in this architecture
eks_master_components_subnet_az1                      = "project_1_private_app_subnet_az1"
eks_master_components_subnet_az2                      = "project_1_private_app_subnet_az2"
eks_master_components_subnets_route_table_association = false
