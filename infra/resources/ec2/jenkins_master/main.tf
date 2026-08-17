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

provider "tls" {}

provider "local" {}

######################
# # KEY PAIR         #
######################

resource "tls_private_key" "jenkins_master_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jenkins_master_key" {
  key_name   = var.key_name
  public_key = tls_private_key.jenkins_master_key.public_key_openssh
}

resource "local_file" "jenkins_master_private_key" {
  content  = tls_private_key.jenkins_master_key.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"
}

######################
# # SECURITY GROUP   #
######################

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment_name}_vpc"]
  }
}

resource "aws_security_group" "jenkins_master_sg" {
  name        = var.security_group_name
  description = "Security group for Jenkins master"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = [var.bastion_cidr]
    description     = "SSH from bastion subnet only"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Jenkins web UI"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

############################
# # BASTION REMOTE STATE  ##
############################

data "terraform_remote_state" "bastion" {
  backend = "s3"
  config = {
    bucket  = "terraform-remote-states-178"
    key     = "ec2/bastion.tfstate"
    region  = "ap-south-1"
    profile = "devops"
  }
}

###########################
# # JENKINS MASTER - VM # #
###########################

module "jenkins_master_ec2" {
  source                      = "../../../modules/ec2"
  region                      = var.region
  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.jenkins_master_key.key_name
  subnet_name                 = var.subnet_name
  instance_name               = var.instance_name
  vpc_name                    = var.vpc_name
  security_group_name         = var.security_group_name
  associate_public_ip_address = var.associate_public_ip_address
  volume_type                 = var.volume_type
  volume_size                 = var.volume_size
  iops                        = var.iops
  throughput                  = var.throughput
  delete_on_termination       = var.delete_on_termination
  user_data                   = <<-EOF
    #!/bin/bash
    echo "${data.terraform_remote_state.bastion.outputs.bastion_public_key}" >> /home/ubuntu/.ssh/authorized_keys
    chmod 600 /home/ubuntu/.ssh/authorized_keys
    chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
  EOF
  tags = {
    Environment                    = var.jenkins_master_vm_tags.environment
    Jenkins_master_vm_backup_cycle = var.jenkins_master_vm_tags.jenkins_master_vm_backup_cycle
  }

  depends_on = [aws_security_group.jenkins_master_sg, aws_key_pair.jenkins_master_key]
}
