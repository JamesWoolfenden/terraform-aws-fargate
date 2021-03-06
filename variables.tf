variable "service_name" {
  type        = string
  description = "The name of ecs service."
}

variable "subnets" {
  type        = list(any)
  description = "The subnets associated with the task or service."
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the Load Balancer target group to associate with the service."
}

variable "vpc_id" {
  type        = string
  description = "VPC Id to associate with ECS Service."
}

variable "desired_count" {
  default     = 0
  type        = string
  description = "The number of instances of the task definition to place and keep running."
}

variable "deployment_maximum_percent" {
  default     = 200
  type        = string
  description = "The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
}

variable "deployment_minimum_healthy_percent" {
  default     = 100
  type        = string
  description = "The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
}

variable "deployment_controller_type" {
  default     = "ECS"
  type        = string
  description = "Type of deployment controller. Valid values: CODE_DEPLOY, ECS."
}

variable "assign_public_ip" {
  default     = false
  type        = string
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false."
}

variable "health_check_grace_period_seconds" {
  default     = 60
  type        = string
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200."
}

variable "ingress_cidr_blocks" {
  default     = ["0.0.0.0/0"]
  type        = list(any)
  description = "List of Ingress CIDR blocks."
}

variable "iam_path" {
  default     = "/"
  type        = string
  description = "Path in which to create the IAM Role and the IAM Policy."
}

variable "iam_description" {
  default     = "Managed by Terraform"
  type        = string
  description = "The description of the IAM Role and the IAM Policy."
}

variable "create_ecs_task_execution_role" {
  default     = true
  type        = string
  description = "Specify true to indicate that ECS Task Execution IAM Role creation."
}

variable "ecs_task_execution_role_arn" {
  default     = ""
  type        = string
  description = "The ARN of the ECS Task Execution IAM Role."
}

variable "common_tags" {
  type        = map(any)
  description = "Implments the common_tags tagging scheme"
}

variable "lb" {
  type = map(any)
}


variable "task_definition" {
}


variable "cluster_name" {
  default = "my-first-cluster"
}
