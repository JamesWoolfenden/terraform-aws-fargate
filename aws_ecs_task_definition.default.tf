resource "aws_ecs_task_definition" "default" {
  family                   = var.task_definition["family"]
  execution_role_arn       = aws_iam_role.ecs-task-default.arn
  container_definitions    = var.task_definition["container_definitions"]
  cpu                      = var.task_definition["cpu"]
  memory                   = var.task_definition["memory"]
  requires_compatibilities = var.task_definition["requires_compatibilities"]
  network_mode             = var.task_definition["network_mode"]
  tags                     = var.common_tags

}
