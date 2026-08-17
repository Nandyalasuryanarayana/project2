variable "region" {}
variable "vpc_name" {}

variable "private_subnet_names" {
  type = list(string)
}

variable "cluster_name" {}
variable "cluster_version" {}
variable "ami_type" {}

variable "node_group_name" {}

variable "node_group_min_size" {
  type = number
}

variable "node_group_max_size" {
  type = number
}

variable "node_group_desired_size" {
  type = number
}

variable "node_group_instance_types" {
  type = list(string)
}

variable "node_group_capacity_type" {}
