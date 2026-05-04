resource "aws_iam_policy" "ecs-task-default" {
  # checkov:skip=CKV_AWS_290: ECS task execution policy requires broad S3 and ECR access
  # checkov:skip=CKV_AWS_355: ECS task execution policy requires wildcard resource
  name        = "${var.service_name}-ecs-task-execution"
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
