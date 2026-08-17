# network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_subnet_az1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet_az2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.eks_master_components_subnet_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_master_components_subnet_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_app_subnet_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_app_subnet_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_data_subnet_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_data_subnet_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_eks_master_components_subnets"></a> [create\_eks\_master\_components\_subnets](#input\_create\_eks\_master\_components\_subnets) | n/a | `bool` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | n/a | `any` | n/a | yes |
| <a name="input_private_app_subnet_az1_cidr"></a> [private\_app\_subnet\_az1\_cidr](#input\_private\_app\_subnet\_az1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_private_app_subnet_az2_cidr"></a> [private\_app\_subnet\_az2\_cidr](#input\_private\_app\_subnet\_az2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_private_data_subnet_az1_cidr"></a> [private\_data\_subnet\_az1\_cidr](#input\_private\_data\_subnet\_az1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_private_data_subnet_az2_cidr"></a> [private\_data\_subnet\_az2\_cidr](#input\_private\_data\_subnet\_az2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_private_eks_master_components_subnet_az1_cidr"></a> [private\_eks\_master\_components\_subnet\_az1\_cidr](#input\_private\_eks\_master\_components\_subnet\_az1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_private_eks_master_components_subnet_az2_cidr"></a> [private\_eks\_master\_components\_subnet\_az2\_cidr](#input\_private\_eks\_master\_components\_subnet\_az2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_pub_subnet_az1_cidr"></a> [pub\_subnet\_az1\_cidr](#input\_pub\_subnet\_az1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_pub_subnet_az2_cidr"></a> [pub\_subnet\_az2\_cidr](#input\_pub\_subnet\_az2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_name"></a> [environment\_name](#output\_environment\_name) | n/a |
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | n/a |
| <a name="output_private_app_subnet_az1"></a> [private\_app\_subnet\_az1](#output\_private\_app\_subnet\_az1) | n/a |
| <a name="output_private_app_subnet_az2"></a> [private\_app\_subnet\_az2](#output\_private\_app\_subnet\_az2) | n/a |
| <a name="output_private_data_subnet_az1"></a> [private\_data\_subnet\_az1](#output\_private\_data\_subnet\_az1) | n/a |
| <a name="output_private_data_subnet_az2"></a> [private\_data\_subnet\_az2](#output\_private\_data\_subnet\_az2) | n/a |
| <a name="output_public_subnet_az1"></a> [public\_subnet\_az1](#output\_public\_subnet\_az1) | n/a |
| <a name="output_public_subnet_az2"></a> [public\_subnet\_az2](#output\_public\_subnet\_az2) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
