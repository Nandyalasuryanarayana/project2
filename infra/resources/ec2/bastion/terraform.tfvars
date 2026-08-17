region                = "ap-south-1"
environment_name      = "project_1"
vpc_name              = "project_1_vpc"
subnet_name           = "project_1_public_subnet_az1"
security_group_name   = "bastion_sg"
ami_id                = "ami-0a1b0c508e1fa9fce"
instance_type         = "t3.micro"
key_name              = "bastion_key"
instance_name         = "bastion_host"
volume_type           = "gp3"
volume_size           = 10
iops                  = 3000
throughput            = 125
delete_on_termination = true
allowed_ssh_cidr      = "0.0.0.0/0"
bastion_tags = {
  environment = "project_1"
}
