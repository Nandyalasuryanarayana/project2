# nat_gateway

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
| [aws_eip.eip_for_nat_gateway_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eip_for_nat_gateway_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_nat_gateway.nat_gateway_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_route_table_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.eks_master_components_subnet_az1_route_table_az1_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.eks_master_components_subnet_az2_route_table_az2_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_app_subnet_az1_route_table_az1_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_app_subnet_az2_route_table_az2_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_data_subnet_az1_route_table_az1_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_data_subnet_az2_route_table_az2_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_internet_gateway.specific_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway) | data source |
| [aws_subnets.app_subnets_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.app_subnets_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.data_subnets_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.data_subnets_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.eks_master_components_subnets_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.eks_master_components_subnets_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public_subnets_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public_subnets_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpcs.specific_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_subnet_az1_name"></a> [app\_subnet\_az1\_name](#input\_app\_subnet\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_app_subnet_az2_name"></a> [app\_subnet\_az2\_name](#input\_app\_subnet\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_data_subnet_az1_name"></a> [data\_subnet\_az1\_name](#input\_data\_subnet\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_data_subnet_az2_name"></a> [data\_subnet\_az2\_name](#input\_data\_subnet\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_eks_master_components_subnet_az1"></a> [eks\_master\_components\_subnet\_az1](#input\_eks\_master\_components\_subnet\_az1) | n/a | `any` | n/a | yes |
| <a name="input_eks_master_components_subnet_az2"></a> [eks\_master\_components\_subnet\_az2](#input\_eks\_master\_components\_subnet\_az2) | n/a | `any` | n/a | yes |
| <a name="input_eks_master_components_subnets_route_table_association"></a> [eks\_master\_components\_subnets\_route\_table\_association](#input\_eks\_master\_components\_subnets\_route\_table\_association) | n/a | `bool` | n/a | yes |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | n/a | `any` | n/a | yes |
| <a name="input_nat_gateway_az1_name"></a> [nat\_gateway\_az1\_name](#input\_nat\_gateway\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_nat_gateway_az2_name"></a> [nat\_gateway\_az2\_name](#input\_nat\_gateway\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_nat_gateway_eip_az1_name"></a> [nat\_gateway\_eip\_az1\_name](#input\_nat\_gateway\_eip\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_nat_gateway_eip_az2_name"></a> [nat\_gateway\_eip\_az2\_name](#input\_nat\_gateway\_eip\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_private_route_table_az1_name"></a> [private\_route\_table\_az1\_name](#input\_private\_route\_table\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_private_route_table_az2_name"></a> [private\_route\_table\_az2\_name](#input\_private\_route\_table\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_pub_subnet_az1_name"></a> [pub\_subnet\_az1\_name](#input\_pub\_subnet\_az1\_name) | n/a | `any` | n/a | yes |
| <a name="input_pub_subnet_az2_name"></a> [pub\_subnet\_az2\_name](#input\_pub\_subnet\_az2\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_subnet_az1_name"></a> [app\_subnet\_az1\_name](#output\_app\_subnet\_az1\_name) | n/a |
| <a name="output_app_subnet_az2_name"></a> [app\_subnet\_az2\_name](#output\_app\_subnet\_az2\_name) | n/a |
| <a name="output_data_subnet_az1_name"></a> [data\_subnet\_az1\_name](#output\_data\_subnet\_az1\_name) | n/a |
| <a name="output_data_subnet_az2_name"></a> [data\_subnet\_az2\_name](#output\_data\_subnet\_az2\_name) | n/a |
| <a name="output_eks_master_components_subnet_az1"></a> [eks\_master\_components\_subnet\_az1](#output\_eks\_master\_components\_subnet\_az1) | n/a |
| <a name="output_eks_master_components_subnet_az2"></a> [eks\_master\_components\_subnet\_az2](#output\_eks\_master\_components\_subnet\_az2) | n/a |
| <a name="output_eks_master_components_subnets_route_table_association"></a> [eks\_master\_components\_subnets\_route\_table\_association](#output\_eks\_master\_components\_subnets\_route\_table\_association) | n/a |
| <a name="output_igw_name"></a> [igw\_name](#output\_igw\_name) | n/a |
| <a name="output_nat_gateway_az1_name"></a> [nat\_gateway\_az1\_name](#output\_nat\_gateway\_az1\_name) | n/a |
| <a name="output_nat_gateway_az2_name"></a> [nat\_gateway\_az2\_name](#output\_nat\_gateway\_az2\_name) | n/a |
| <a name="output_nat_gateway_eip_az1_name"></a> [nat\_gateway\_eip\_az1\_name](#output\_nat\_gateway\_eip\_az1\_name) | n/a |
| <a name="output_nat_gateway_eip_az2_name"></a> [nat\_gateway\_eip\_az2\_name](#output\_nat\_gateway\_eip\_az2\_name) | n/a |
| <a name="output_private_route_table_az1_name"></a> [private\_route\_table\_az1\_name](#output\_private\_route\_table\_az1\_name) | n/a |
| <a name="output_private_route_table_az2_name"></a> [private\_route\_table\_az2\_name](#output\_private\_route\_table\_az2\_name) | n/a |
| <a name="output_pub_subnet_az1_name"></a> [pub\_subnet\_az1\_name](#output\_pub\_subnet\_az1\_name) | n/a |
| <a name="output_pub_subnet_az2_name"></a> [pub\_subnet\_az2\_name](#output\_pub\_subnet\_az2\_name) | n/a |
| <a name="output_region"></a> [region](#output\_region) | Outputs.tf file for Terraform This file defines output variables for the infrastructure created using Terraform Each output variable corresponds to a specific input variable provided in the variables.tf file =================================================================================================# |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
