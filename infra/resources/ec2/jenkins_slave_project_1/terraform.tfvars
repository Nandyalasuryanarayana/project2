#####################################################################################
# # This file contains input variable values for Terraform configuration.           #
# # Use this file to specify values for variables defined in your Terraform files.  #
#####################################################################################

################################
# # JENKINS SLAVE PROCX - VM # #
################################

region                      = "ap-south-1"
vpc_name                    = "project_1_vpc"
subnet_name                 = "project_1_private_app_subnet_az1"
security_group_name         = "jenkins_slave_project_1_sg"
ami_id                      = ""
instance_type               = "t3.medium"
key_name                    = "jenkins_slave_project_1_key"
instance_name               = "jenkins_slave_project_1
associate_public_ip_address = "false"
volume_type                 = "gp2"
volume_size                 = 10
delete_on_termination       = false
jenkins_slave_reachx_vm_tags = {
  environment                          = "project_1"
  jenkins_slave_project_1_vm_backup_cycle = "monthly"
}
