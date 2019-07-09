resource "aws_iam_role_policy_attachment" "ecs-task-default" {
  count = local.enabled_ecs_task_execution

  role       = aws_iam_role.ecs-task-default.0.name
  policy_arn = aws_iam_policy.ecs-task-default.0.arn
}
