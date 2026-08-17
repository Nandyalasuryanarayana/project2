# Select VPC with specific tag
data "aws_vpcs" "specific_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Select subnets with specific tag
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.specific_vpc.ids
  }

  tags = {
    Name = var.subnet_name
  }
}

# Select security group with specific tag
data "aws_security_groups" "app_server_security_group" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }
}

# Create EC2 instance
resource "aws_instance" "vartual_machine" {
  ami                         = var.ami_id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  monitoring                  = true
  vpc_security_group_ids      = data.aws_security_groups.app_server_security_group.ids
  user_data                   = var.user_data != "" ? var.user_data : null
  user_data_replace_on_change = true

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
    iops                  = var.iops
    throughput            = var.throughput
  }
  # tags = {
  #   Name = "${var.instance_name}"
  # }
  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )
}
