resource "aws_iam_policy" "default" {
  count = "${local.enabled_ecs_task_execution}"

  name        = "${local.iam_name}"
  policy      = "${data.aws_iam_policy.ecs_task_execution.policy}"
  path        = "${var.iam_path}"
  description = "${var.iam_description}"
}
