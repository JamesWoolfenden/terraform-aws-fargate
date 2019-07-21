
# terraform-aws-fargate [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-fargate.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-fargate) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-fargate.svg)](https://github.com/JamesWoolfenden/terraform-aws-fargate/releases/latest)

## Introduction

Some text here

## Usage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| assign\_public\_ip | Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. | string | `"false"` | no |
| cluster | ARN of an ECS cluster. | string | n/a | yes |
| common\_tags | Implments the common_tags tagging scheme | map | n/a | yes |
| container\_definitions | A list of valid container definitions provided as a single valid JSON document. | string | n/a | yes |
| container\_port | The port on the container to associate with the load balancer. | string | n/a | yes |
| cpu | The number of cpu units used by the task. | string | `"256"` | no |
| create\_ecs\_task\_execution\_role | Specify true to indicate that ECS Task Execution IAM Role creation. | string | `"true"` | no |
| deployment\_controller\_type | Type of deployment controller. Valid values: CODE_DEPLOY, ECS. | string | `"ECS"` | no |
| deployment\_maximum\_percent | The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. | string | `"200"` | no |
| deployment\_minimum\_healthy\_percent | The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | string | `"100"` | no |
| desired\_count | The number of instances of the task definition to place and keep running. | string | `"0"` | no |
| ecs\_task\_execution\_role\_arn | The ARN of the ECS Task Execution IAM Role. | string | `""` | no |
| enabled | Set to false to prevent the module from creating anything. | string | `"true"` | no |
| family |  | string | n/a | yes |
| health\_check\_grace\_period\_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. | string | `"60"` | no |
| iam\_description | The description of the IAM Role and the IAM Policy. | string | `"Managed by Terraform"` | no |
| iam\_path | Path in which to create the IAM Role and the IAM Policy. | string | `"/"` | no |
| ingress\_cidr\_blocks | List of Ingress CIDR blocks. | list | `[ "0.0.0.0/0" ]` | no |
| lb\_container\_name |  | string | `""` | no |
| lb\_container\_port |  | string | `""` | no |
| memory | The amount (in MiB) of memory used by the task. | string | `"512"` | no |
| name | The name of ecs service. | string | n/a | yes |
| requires\_compatibilities | A set of launch types required by the task. The valid values are EC2 and FARGATE. | list | `[ "FARGATE" ]` | no |
| subnets | The subnets associated with the task or service. | list | n/a | yes |
| target\_group\_arn | The ARN of the Load Balancer target group to associate with the service. | string | n/a | yes |
| vpc\_id | VPC Id to associate with ECS Service. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecs\_service\_cluster | The Amazon Resource Name (ARN) of cluster which the service runs on. |
| ecs\_service\_desired\_count | The number of instances of the task definition. |
| ecs\_service\_iam\_role | The ARN of IAM role used for ELB. |
| ecs\_service\_id | The Amazon Resource Name (ARN) that identifies the service. |
| ecs\_service\_name | The name of the service. |
| ecs\_task\_definition\_arn | Full ARN of the Task Definition (including both family and revision). |
| ecs\_task\_definition\_family | The family of the Task Definition. |
| ecs\_task\_definition\_revision | The revision of the task in a particular family. |
| ecs\_task\_iam\_policy\_arn | The ARN assigned by AWS to this IAM Policy. |
| ecs\_task\_iam\_policy\_description | The description of the IAM Policy. |
| ecs\_task\_iam\_policy\_document | The policy document of the IAM Policy. |
| ecs\_task\_iam\_policy\_id | The IAM Policy's ID. |
| ecs\_task\_iam\_policy\_name | The name of the IAM Policy. |
| ecs\_task\_iam\_policy\_path | The path of the IAM Policy. |
| ecs\_task\_iam\_role\_arn | The Amazon Resource Name (ARN) specifying the IAM Role. |
| ecs\_task\_iam\_role\_create\_date | The creation date of the IAM Role. |
| ecs\_task\_iam\_role\_description | The description of the IAM Role. |
| ecs\_task\_iam\_role\_name | The name of the IAM Role. |
| ecs\_task\_iam\_role\_unique\_id | The stable and unique string identifying the IAM Role. |
| security\_group\_arn | The ARN of the ECS Service security group. |
| security\_group\_description | The description of the ECS Service security group. |
| security\_group\_egress | The egress rules of the ECS Service security group. |
| security\_group\_id | The ID of the ECS Service security group. |
| security\_group\_ingress | The ingress rules of the ECS Service security group. |
| security\_group\_name | The name of the ECS Service security group. |
| security\_group\_owner\_id | The owner ID of the ECS Service security group. |
| security\_group\_vpc\_id | The VPC ID of the ECS Service security group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
