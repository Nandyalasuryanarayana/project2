variable "region" {}
variable "environment_name" {}
variable "vpc_name" {}
variable "subnet_name" {}
variable "security_group_name" {}
variable "ami_id" {}
variable "associate_public_ip_address" {}
variable "instance_type" {}
variable "key_name" {}
variable "instance_name" {}
variable "volume_type" { type = string }
variable "volume_size" { type = number }
variable "iops" { type = number }
variable "throughput" { type = number }
variable "delete_on_termination" { type = bool }
variable "bastion_cidr" { type = string }
