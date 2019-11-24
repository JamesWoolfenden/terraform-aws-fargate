resource "aws_ecs_service" "default" {
  name                               = var.name
  task_definition                    = aws_ecs_task_definition.default.arn
  cluster                            = var.cluster
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  deployment_controller {
    type = var.deployment_controller_type
  }

  network_configuration {
    subnets          = var.subnets
    security_groups  = [aws_security_group.default.id]
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    container_name = var.lb["container_name"]
    container_port = var.lb["container_port"]
  }

  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  lifecycle {
    ignore_changes = ["desired_count"]
  }

  tags = var.common_tags
}
