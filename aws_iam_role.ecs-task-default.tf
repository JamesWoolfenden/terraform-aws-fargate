resource "aws_iam_role" "ecs-task-default" {
  count              = local.enabled_ecs_task_execution
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description        = var.iam_description
  name               = local.iam_name
  path               = var.iam_path
  tags               = var.common_tags
}
