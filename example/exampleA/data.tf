data "aws_vpcs" "cluster" {
  tags = {
    Name                            = "ECS ${var.cluster} - VPC"
    "aws:cloudformation:stack-name" = "EC2ContainerService-${var.cluster}"
  }
}

data "aws_subnet_ids" "cluster" {
  vpc_id = "${element(data.aws_vpcs.cluster.ids, 0)}"
}

data "aws_caller_identity" "current" {}
