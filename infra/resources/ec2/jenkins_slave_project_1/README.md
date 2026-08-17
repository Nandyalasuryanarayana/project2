# jenkins_slave_reachx

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_jenkins_slave_reachx"></a> [jenkins\_slave\_reachx](#module\_jenkins\_slave\_reachx) | ../../../reusable_modules/ec2 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the EC2 instance | `any` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | associate public ip address as per the requirement | `any` | n/a | yes |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | Whether the volume should be deleted when the EC2 instance is terminated | `bool` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the EC2 instance | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the EC2 instance | `any` | n/a | yes |
| <a name="input_jenkins_slave_reachx_vm_tags"></a> [jenkins\_slave\_reachx\_vm\_tags](#input\_jenkins\_slave\_reachx\_vm\_tags) | Additional tags for the instance | <pre>object({<br/>    environment                          = string<br/>    jenkins_slave_reachx_vm_backup_cycle = string<br/>  })</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the key pair used to launch the EC2 instance | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `any` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group with the specific tag | `any` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet with the specific tag | `any` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the EBS volume in GB | `number` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of the EBS volume (e.g., gp2, io1) | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC with the specific tag | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
