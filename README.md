# terraform-aws-fargate

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-fargate/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-fargate)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-fargate.svg)](https://github.com/JamesWoolfenden/terraform-aws-fargate/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Inputs

| Name                               | Description                                                                                                                                                           | Type     | Default                           | Required |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------------------------- | :------: |
| assign_public_ip                   | Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false.                                                                     | `string` | `false`                           |    no    |
| cluster_name                       | n/a                                                                                                                                                                   | `string` | `"my-first-cluster"`              |    no    |
| common_tags                        | Implments the common_tags tagging scheme                                                                                                                              | `map`    | n/a                               |   yes    |
| create_ecs_task_execution_role     | Specify true to indicate that ECS Task Execution IAM Role creation.                                                                                                   | `string` | `true`                            |    no    |
| deployment_controller_type         | Type of deployment controller. Valid values: CODE_DEPLOY, ECS.                                                                                                        | `string` | `"ECS"`                           |    no    |
| deployment_maximum_percent         | The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment.                  | `string` | `200`                             |    no    |
| deployment_minimum_healthy_percent | The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `string` | `100`                             |    no    |
| desired_count                      | The number of instances of the task definition to place and keep running.                                                                                             | `string` | `0`                               |    no    |
| ecs_task_execution_role_arn        | The ARN of the ECS Task Execution IAM Role.                                                                                                                           | `string` | `""`                              |    no    |
| health_check_grace_period_seconds  | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200.                                          | `string` | `60`                              |    no    |
| iam_description                    | The description of the IAM Role and the IAM Policy.                                                                                                                   | `string` | `"Managed by Terraform"`          |    no    |
| iam_path                           | Path in which to create the IAM Role and the IAM Policy.                                                                                                              | `string` | `"/"`                             |    no    |
| ingress_cidr_blocks                | List of Ingress CIDR blocks.                                                                                                                                          | `list`   | <pre>[<br> "0.0.0.0/0"<br>]</pre> |    no    |
| lb                                 | n/a                                                                                                                                                                   | `map`    | n/a                               |   yes    |
| service_name                       | The name of ecs service.                                                                                                                                              | `string` | n/a                               |   yes    |
| subnets                            | The subnets associated with the task or service.                                                                                                                      | `list`   | n/a                               |   yes    |
| target_group_arn                   | The ARN of the Load Balancer target group to associate with the service.                                                                                              | `string` | n/a                               |   yes    |
| task_definition                    | n/a                                                                                                                                                                   | `any`    | n/a                               |   yes    |
| vpc_id                             | VPC Id to associate with ECS Service.                                                                                                                                 | `string` | n/a                               |   yes    |

## Outputs

| Name                   | Description                                                    |
| ---------------------- | -------------------------------------------------------------- |
| ecs_service            | The ECS service.                                               |
| ecs_task_definition    | The Full Task Definition (including both family and revision). |
| ecs_task_policy        | n/a                                                            |
| iam_role               | n/a                                                            |
| security_group_default | The ECS Service security group.                                |

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

Copyright © 2019-2020 James Woolfenden

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
