variable "region" {
  description = "AWS region"
}

variable "environment_name" {
  description = "Environment name used to look up the VPC"
}

variable "vpc_name" {
  description = "Name tag of the VPC"
}

variable "subnet_name" {
  description = "Name tag of the public subnet"
}

variable "security_group_name" {
  description = "Name for the bastion security group"
}

variable "ami_id" {
  description = "AMI ID for the bastion instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Name of the key pair"
}

variable "instance_name" {
  description = "Name tag for the bastion instance"
}

variable "volume_type" {
  type        = string
  description = "EBS volume type"
}

variable "volume_size" {
  type        = number
  description = "EBS volume size in GB"
}

variable "iops" {
  type        = number
  description = "IOPS for the root volume"
}

variable "throughput" {
  type        = number
  description = "Throughput in MiB/s for the root volume"
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete root volume on instance termination"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH into the bastion host"
}

variable "bastion_tags" {
  description = "Additional tags for the bastion instance"
  type = object({
    environment = string
  })
}
