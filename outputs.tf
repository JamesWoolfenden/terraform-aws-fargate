output "ecs_service" {
  value       = aws_ecs_service.default
  description = "The ECS service."
}
output "security_group_default" {
  value       = aws_security_group.default
  description = "The ECS Service security group."
}
output "ecs_task_definition" {
  value       = aws_ecs_task_definition.default
  description = "The Full Task Definition (including both family and revision)."
}
output "iam_role" {
  value = aws_iam_role.ecs-task-default
}
output "ecs_task_policy" {
  value = aws_iam_policy.ecs-task-default
}
