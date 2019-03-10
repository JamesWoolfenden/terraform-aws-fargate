## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| assign_public_ip | Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. | string | `false` | no |
| cluster | ARN of an ECS cluster. | string | - | yes |
| common_tags | Implments the common_tags tagging scheme | map | - | yes |
| container_definitions | A list of valid container definitions provided as a single valid JSON document. | string | - | yes |
| container_port | The port on the container to associate with the load balancer. | string | - | yes |
| cpu | The number of cpu units used by the task. | string | `256` | no |
| create_ecs_task_execution_role | Specify true to indicate that ECS Task Execution IAM Role creation. | string | `true` | no |
| deployment_controller_type | Type of deployment controller. Valid values: CODE_DEPLOY, ECS. | string | `ECS` | no |
| deployment_maximum_percent | The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. | string | `200` | no |
| deployment_minimum_healthy_percent | The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | string | `100` | no |
| desired_count | The number of instances of the task definition to place and keep running. | string | `0` | no |
| ecs_task_execution_role_arn | The ARN of the ECS Task Execution IAM Role. | string | `` | no |
| enabled | Set to false to prevent the module from creating anything. | string | `true` | no |
| family | - | string | - | yes |
| health_check_grace_period_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. | string | `60` | no |
| iam_description | The description of the IAM Role and the IAM Policy. | string | `Managed by Terraform` | no |
| iam_path | Path in which to create the IAM Role and the IAM Policy. | string | `/` | no |
| ingress_cidr_blocks | List of Ingress CIDR blocks. | list | `<list>` | no |
| load_balancer | - | list | `<list>` | no |
| memory | The amount (in MiB) of memory used by the task. | string | `512` | no |
| name | The name of ecs service. | string | - | yes |
| requires_compatibilities | A set of launch types required by the task. The valid values are EC2 and FARGATE. | list | `<list>` | no |
| subnets | The subnets associated with the task or service. | list | - | yes |
| target_group_arn | The ARN of the Load Balancer target group to associate with the service. | string | - | yes |
| vpc_id | VPC Id to associate with ECS Service. | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecs_service_cluster | The Amazon Resource Name (ARN) of cluster which the service runs on. |
| ecs_service_desired_count | The number of instances of the task definition. |
| ecs_service_iam_role | The ARN of IAM role used for ELB. |
| ecs_service_id | The Amazon Resource Name (ARN) that identifies the service. |
| ecs_service_name | The name of the service. |
| ecs_task_definition_arn | Full ARN of the Task Definition (including both family and revision). |
| ecs_task_definition_family | The family of the Task Definition. |
| ecs_task_definition_revision | The revision of the task in a particular family. |
| iam_policy_arn | The ARN assigned by AWS to this IAM Policy. |
| iam_policy_description | The description of the IAM Policy. |
| iam_policy_document | The policy document of the IAM Policy. |
| iam_policy_id | The IAM Policy's ID. |
| iam_policy_name | The name of the IAM Policy. |
| iam_policy_path | The path of the IAM Policy. |
| iam_role_arn | The Amazon Resource Name (ARN) specifying the IAM Role. |
| iam_role_create_date | The creation date of the IAM Role. |
| iam_role_description | The description of the IAM Role. |
| iam_role_name | The name of the IAM Role. |
| iam_role_unique_id | The stable and unique string identifying the IAM Role. |
| security_group_arn | The ARN of the ECS Service security group. |
| security_group_description | The description of the ECS Service security group. |
| security_group_egress | The egress rules of the ECS Service security group. |
| security_group_id | The ID of the ECS Service security group. |
| security_group_ingress | The ingress rules of the ECS Service security group. |
| security_group_name | The name of the ECS Service security group. |
| security_group_owner_id | The owner ID of the ECS Service security group. |
| security_group_vpc_id | The VPC ID of the ECS Service security group. |

