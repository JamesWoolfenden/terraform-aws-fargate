resource "aws_iam_role" "default" {
  count = "${local.enabled_ecs_task_execution}"

  name               = "${local.iam_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
  path               = "${var.iam_path}"
  description        = "${var.iam_description}"

  tags = "${var.common_tags}"
}
