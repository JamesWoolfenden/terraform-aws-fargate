resource "aws_iam_role_policy_attachment" "ecs-task-default" {
  role       = aws_iam_role.ecs-task-default.name
  policy_arn = aws_iam_policy.ecs-task-default.arn
}
