variable "region" {
  description = "Name of the region"
}
variable "vpc_name" {
  description = "Name of the VPC with the specific tag"
}

variable "subnet_name" {
  description = "Name of the subnet with the specific tag"
}

variable "security_group_name" {
  description = "Name of the security group with the specific tag"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}
variable "associate_public_ip_address" {
  description = "associate public ip address as per the requirement"
}
variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "key_name" {
  description = "Name of the key pair used to launch the EC2 instance"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
}

variable "volume_type" {
  description = "Type of the EBS volume (e.g., gp2, io1)"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "iops" {
  description = "The amount of IOPS to provision for the root block device"
  type        = number
}

variable "throughput" {
  description = "The throughput in MiB/s to provision for the root block device"
  type        = number
}

variable "delete_on_termination" {
  description = "Whether the volume should be deleted when the EC2 instance is terminated"
  type        = bool
}

variable "tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data script to run on first boot"
  type        = string
  default     = ""
}
