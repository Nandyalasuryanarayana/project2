variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "ami_type" {}
variable "environment" {}
variable "node_group_name" {}
variable "node_group_min_size" { type = number }
variable "node_group_max_size" { type = number }
variable "node_group_desired_size" { type = number }
variable "node_group_instance_types" { type = list(string) }
variable "node_group_capacity_type" {}
