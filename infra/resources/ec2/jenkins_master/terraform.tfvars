#####################################################################################
# # This file contains input variable values for Terraform configuration.           #
# # Use this file to specify values for variables defined in your Terraform files.  #
#####################################################################################

###########################
# # JENKINS MASTER - VM # #
###########################

region                      = "ap-south-1"
environment_name            = "project_1"
vpc_name                    = "project_1_vpc"
subnet_name                 = "project_1_private_app_subnet_az1"
security_group_name         = "jenkins_master_sg"
ami_id                      = "ami-0a1b0c508e1fa9fce"
instance_type               = "t3.micro"
key_name                    = "jenkins_master_key"
instance_name               = "jenkins_master_vm"
associate_public_ip_address = "false"
volume_type                 = "gp3"
volume_size                 = 20
iops                        = 3000
throughput                  = 125
delete_on_termination       = false
bastion_cidr                = "192.168.0.0/24"
jenkins_master_vm_tags = {
  environment                    = "project_1"
  jenkins_master_vm_backup_cycle = "weekly"
}
