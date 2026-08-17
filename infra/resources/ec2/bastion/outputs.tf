output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = module.bastion_ec2.instance_id
}

output "bastion_security_group_id" {
  description = "Security group ID of the bastion host"
  value       = aws_security_group.bastion_sg.id
}

output "bastion_public_key" {
  description = "Bastion host public key to be added to Jenkins master authorized_keys"
  value       = tls_private_key.bastion_key.public_key_openssh
}
