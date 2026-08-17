provider "aws" {
  region  = var.region
  profile = "devops"
}

provider "tls" {}

provider "local" {}

######################
# # KEY PAIR         #
######################

resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion_key" {
  key_name   = var.key_name
  public_key = tls_private_key.bastion_key.public_key_openssh
}

resource "local_file" "bastion_private_key" {
  content  = tls_private_key.bastion_key.private_key_pem
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

resource "aws_security_group" "bastion_sg" {
  name        = var.security_group_name
  description = "Security group for bastion host - allows SSH from internet"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "SSH from internet"
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

######################
# # BASTION HOST     #
######################

module "bastion_ec2" {
  source                      = "../../../modules/ec2"
  region                      = var.region
  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.bastion_key.key_name
  subnet_name                 = var.subnet_name
  instance_name               = var.instance_name
  vpc_name                    = var.vpc_name
  security_group_name         = var.security_group_name
  associate_public_ip_address = true
  volume_type                 = var.volume_type
  volume_size                 = var.volume_size
  iops                        = var.iops
  throughput                  = var.throughput
  delete_on_termination       = var.delete_on_termination
  tags = {
    Environment = var.bastion_tags.environment
  }

  depends_on = [aws_security_group.bastion_sg, aws_key_pair.bastion_key]
}
