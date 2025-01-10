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
| [aws_ecr_lifecycle_policy.skillup_repo_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.skillup_repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | name for the VPC | `string` | n/a | yes |
| <a name="input_my_repository_name"></a> [my\_repository\_name](#input\_my\_repository\_name) | Name of the ECR repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_link"></a> [link](#output\_link) | DNS name of the Application Load Balancer |
| <a name="output_repo"></a> [repo](#output\_repo) | DNS name of the Application Load Balancer |
