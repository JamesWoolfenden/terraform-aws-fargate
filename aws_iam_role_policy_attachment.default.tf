resource "aws_iam_role_policy_attachment" "default" {
  count = "${local.enabled_ecs_task_execution}"

  role       = "${aws_iam_role.default.name}"
  policy_arn = "${aws_iam_policy.default.arn}"
}
