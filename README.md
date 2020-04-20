[![Slalom][logo]](https://slalom.com)

# terraform-aws-fargate

[![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-fargate.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-fargate)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-fargate.svg)](https://github.com/JamesWoolfenden/terraform-aws-fargate/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| assign\_public\_ip | Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. | `string` | `false` | no |
| cluster\_name | n/a | `string` | `"my-first-cluster"` | no |
| common\_tags | Implments the common\_tags tagging scheme | `map` | n/a | yes |
| create\_ecs\_task\_execution\_role | Specify true to indicate that ECS Task Execution IAM Role creation. | `string` | `true` | no |
| deployment\_controller\_type | Type of deployment controller. Valid values: CODE\_DEPLOY, ECS. | `string` | `"ECS"` | no |
| deployment\_maximum\_percent | The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. | `string` | `200` | no |
| deployment\_minimum\_healthy\_percent | The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `string` | `100` | no |
| desired\_count | The number of instances of the task definition to place and keep running. | `string` | `0` | no |
| ecs\_task\_execution\_role\_arn | The ARN of the ECS Task Execution IAM Role. | `string` | `""` | no |
| health\_check\_grace\_period\_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. | `string` | `60` | no |
| iam\_description | The description of the IAM Role and the IAM Policy. | `string` | `"Managed by Terraform"` | no |
| iam\_path | Path in which to create the IAM Role and the IAM Policy. | `string` | `"/"` | no |
| ingress\_cidr\_blocks | List of Ingress CIDR blocks. | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| lb | n/a | `map` | n/a | yes |
| service\_name | The name of ecs service. | `string` | n/a | yes |
| subnets | The subnets associated with the task or service. | `list` | n/a | yes |
| target\_group\_arn | The ARN of the Load Balancer target group to associate with the service. | `string` | n/a | yes |
| task\_definition | n/a | `any` | n/a | yes |
| vpc\_id | VPC Id to associate with ECS Service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecs\_service | The ECS service. |
| ecs\_task\_definition | The Full Task Definition (including both family and revision). |
| ecs\_task\_policy | n/a |
| iam\_role | n/a |
| security\_group\_default | The ECS Service security group. |

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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-fargate&url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-fargate&url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-fargate
[share_email]: mailto:?subject=terraform-aws-fargate&body=https://github.com/JamesWoolfenden/terraform-aws-fargate
