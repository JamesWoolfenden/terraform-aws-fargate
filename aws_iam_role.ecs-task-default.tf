resource "aws_iam_role" "ecs-task-default" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description        = var.iam_description
  name               = "${var.service_name}-ecs-task-execution"
  path               = var.iam_path
  tags               = var.common_tags
}
