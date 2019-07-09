resource "aws_iam_policy" "ecs-task-default" {
  count       = local.enabled_ecs_task_execution
  name        = local.iam_name
  path        = var.iam_path
  description = var.iam_description

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "S3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}
