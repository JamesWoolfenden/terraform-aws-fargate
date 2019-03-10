locals {
  iam_name                   = "${var.name}-ecs-task-execution"
  enabled_ecs_task_execution = "${var.enabled && var.create_ecs_task_execution_role ? 1 : 0}"
  security_group_name        = "${var.name}-ecs-fargate"
}
