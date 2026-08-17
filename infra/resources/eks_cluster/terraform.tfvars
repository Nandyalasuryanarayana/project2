region               = "ap-south-1"
vpc_name             = "project_1_vpc"
private_subnet_names = ["project_1_public_subnet_az1", "project_1_public_subnet_az2"]

cluster_name    = "devopsintern-eks-cluster"
cluster_version = "1.33"
ami_type        = "AL2023_x86_64_STANDARD"

node_group_name           = "project-1-node-group"
node_group_min_size       = 1
node_group_max_size       = 2
node_group_desired_size   = 1
node_group_instance_types = ["t3.medium"]
node_group_capacity_type  = "ON_DEMAND"
