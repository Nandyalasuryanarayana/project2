##############################################################################
# # main.tf file for Terraform module                                        #
# # This file contains the main configuration for the Terraform module       #
##############################################################################

########################
# # PROVIDER - BLOCK # #
########################

provider "aws" {
  region  = var.region
  profile = "devops" #The "devops" is an IAM user created to authenticate the terraform"
}

#####################################
# # JENKINS SLAVE PROJECT -1 - VM # #
#####################################

module "jenkins_slave_reachx" {
  source                      = "../../../reusable_modules/ec2"
  region                      = var.region
  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_name                 = var.subnet_name
  instance_name               = var.instance_name
  vpc_name                    = var.vpc_name
  security_group_name         = var.security_group_name
  associate_public_ip_address = var.associate_public_ip_address
  volume_type                 = var.volume_type
  volume_size                 = var.volume_size
  delete_on_termination       = var.delete_on_termination
  tags = {
    Environment                          = var.jenkins_slave_reachx_vm_tags.environment
    Jenkins_slave_reachx_vm_backup_cycle = var.jenkins_slave_reachx_vm_tags.jenkins_slave_reachx_vm_backup_cycle
  }
}
