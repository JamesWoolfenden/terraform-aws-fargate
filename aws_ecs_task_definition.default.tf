resource "aws_ecs_task_definition" "default" {
  count                    = "${var.enabled}"
  family                   = "${var.family}"
  execution_role_arn       = "${var.create_ecs_task_execution_role ? join("", aws_iam_role.default.*.arn) : var.ecs_task_execution_role_arn}"
  container_definitions    = "${var.container_definitions}"
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  requires_compatibilities = ["${var.requires_compatibilities}"]
  network_mode             = "awsvpc"
  family                   = "${var.family}"
  tags                     = "${var.common_tags}"
}
