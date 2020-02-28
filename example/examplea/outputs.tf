
output "ecs_service" {
  value       = module.fargate.ecs_service
  description = "The ECS service."
}

output "security_group_default" {
  value       = module.fargate.security_group_default
  description = "The ECS Service security group."
}

output "ecs_task_definition" {
  value       = module.fargate.ecs_task_definition
  description = "The Full Task Definition (including both family and revision)."
}

output "iam_role" {
  value = module.fargate.iam_role
}

output "ecs_task_policy" {
  value = module.fargate.ecs_task_policy
}
