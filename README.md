# terraform-aws-fargate

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-fargate/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-fargate)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-fargate.svg)](https://github.com/JamesWoolfenden/terraform-aws-fargate/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-fargate.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-fargate/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-fargate/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-fargate&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-fargate/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-fargate&benchmark=INFRASTRUCTURE+SECURITY)

Module to provision fargate containers.

## Introduction

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "fargate" {
  source           = "JamesWoolfenden/fargate/aws"
  version          = "0.1.1"
  common_tags      = var.common_tags
  task_definition  = var.task_definition
  name             = "my-first-service"
  lb               = var.lb
  cluster          = "arn:aws:ecs:eu-west-1:${data.aws_caller_identity.current.account_id}:cluster/${var.cluster}"
  subnets          = data.aws_subnet_ids.cluster.ids
  target_group_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.target_group_arn}"
  vpc_id           = element(data.aws_vpcs.cluster.ids, 0)
}
```

## Costs

```text
Monthly cost estimate

Project: .

 Name                                    Monthly Qty  Unit       Monthly Cost

 module.fargate.aws_ecs_service.default
 ├─ Per GB per hour                              365  GB-hours          $1.87
 └─ Per vCPU per hour                          182.5  CPU-hours         $8.50

 PROJECT TOTAL                                                         $10.36

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                      | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_ecs_cluster.far](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster)                                            | resource    |
| [aws_ecs_service.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service)                                        | resource    |
| [aws_ecs_task_definition.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition)                        | resource    |
| [aws_iam_policy.ecs-task-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                 | resource    |
| [aws_iam_role.ecs-task-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                     | resource    |
| [aws_iam_role_policy_attachment.ecs-task-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                  | resource    |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)                         | resource    |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)                        | resource    |
| [aws_iam_policy.ecs_task_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy)                            | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)          | data source |

## Inputs

| Name                                                                                                                                    | Description                                                                                                                                                           | Type        | Default                           | Required |
| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | --------------------------------- | :------: |
| <a name="input_assign_public_ip"></a> [assign_public_ip](#input_assign_public_ip)                                                       | Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false.                                                                     | `string`    | `false`                           |    no    |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)                                                                   | n/a                                                                                                                                                                   | `string`    | `"my-first-cluster"`              |    no    |
| <a name="input_common_tags"></a> [common_tags](#input_common_tags)                                                                      | Implments the common_tags tagging scheme                                                                                                                              | `map(any)`  | n/a                               |   yes    |
| <a name="input_create_ecs_task_execution_role"></a> [create_ecs_task_execution_role](#input_create_ecs_task_execution_role)             | Specify true to indicate that ECS Task Execution IAM Role creation.                                                                                                   | `string`    | `true`                            |    no    |
| <a name="input_deployment_controller_type"></a> [deployment_controller_type](#input_deployment_controller_type)                         | Type of deployment controller. Valid values: CODE_DEPLOY, ECS.                                                                                                        | `string`    | `"ECS"`                           |    no    |
| <a name="input_deployment_maximum_percent"></a> [deployment_maximum_percent](#input_deployment_maximum_percent)                         | The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment.                  | `string`    | `200`                             |    no    |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment_minimum_healthy_percent](#input_deployment_minimum_healthy_percent) | The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `string`    | `100`                             |    no    |
| <a name="input_desired_count"></a> [desired_count](#input_desired_count)                                                                | The number of instances of the task definition to place and keep running.                                                                                             | `string`    | `0`                               |    no    |
| <a name="input_ecs_task_execution_role_arn"></a> [ecs_task_execution_role_arn](#input_ecs_task_execution_role_arn)                      | The ARN of the ECS Task Execution IAM Role.                                                                                                                           | `string`    | `""`                              |    no    |
| <a name="input_health_check_grace_period_seconds"></a> [health_check_grace_period_seconds](#input_health_check_grace_period_seconds)    | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200.                                          | `string`    | `60`                              |    no    |
| <a name="input_iam_description"></a> [iam_description](#input_iam_description)                                                          | The description of the IAM Role and the IAM Policy.                                                                                                                   | `string`    | `"Managed by Terraform"`          |    no    |
| <a name="input_iam_path"></a> [iam_path](#input_iam_path)                                                                               | Path in which to create the IAM Role and the IAM Policy.                                                                                                              | `string`    | `"/"`                             |    no    |
| <a name="input_ingress_cidr_blocks"></a> [ingress_cidr_blocks](#input_ingress_cidr_blocks)                                              | List of Ingress CIDR blocks.                                                                                                                                          | `list(any)` | <pre>[<br> "0.0.0.0/0"<br>]</pre> |    no    |
| <a name="input_lb"></a> [lb](#input_lb)                                                                                                 | n/a                                                                                                                                                                   | `map(any)`  | n/a                               |   yes    |
| <a name="input_service_name"></a> [service_name](#input_service_name)                                                                   | The name of ecs service.                                                                                                                                              | `string`    | n/a                               |   yes    |
| <a name="input_subnets"></a> [subnets](#input_subnets)                                                                                  | The subnets associated with the task or service.                                                                                                                      | `list(any)` | n/a                               |   yes    |
| <a name="input_target_group_arn"></a> [target_group_arn](#input_target_group_arn)                                                       | The ARN of the Load Balancer target group to associate with the service.                                                                                              | `string`    | n/a                               |   yes    |
| <a name="input_task_definition"></a> [task_definition](#input_task_definition)                                                          | n/a                                                                                                                                                                   | `any`       | n/a                               |   yes    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                                     | VPC Id to associate with ECS Service.                                                                                                                                 | `string`    | n/a                               |   yes    |

## Outputs

| Name                                                                                                  | Description                                                    |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| <a name="output_ecs_service"></a> [ecs_service](#output_ecs_service)                                  | The ECS service.                                               |
| <a name="output_ecs_task_definition"></a> [ecs_task_definition](#output_ecs_task_definition)          | The Full Task Definition (including both family and revision). |
| <a name="output_ecs_task_policy"></a> [ecs_task_policy](#output_ecs_task_policy)                      | n/a                                                            |
| <a name="output_iam_role"></a> [iam_role](#output_iam_role)                                           | n/a                                                            |
| <a name="output_security_group_default"></a> [security_group_default](#output_security_group_default) | The ECS Service security group.                                |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-codecommit/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-codecommit/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-fargate&url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-fargate&url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_email]: mailto:?subject=terraform-aws-fargate&body=https://github.com/JamesWoolfenden/terraform-aws-fargate
