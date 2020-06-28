resource "aws_ecs_cluster" "far" {
  name = var.cluster_name
  tags = var.common_tags
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
