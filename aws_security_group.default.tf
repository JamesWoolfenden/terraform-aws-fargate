resource "aws_security_group" "default" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  name        = "${var.service_name}-ecs-fargate"
  description = "ECS Allowed Ports"
  vpc_id      = var.vpc_id
  tags        = var.common_tags
}
resource "aws_security_group_rule" "ingress" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  description = "Ingress rule"
  type        = "ingress"
  from_port   = var.lb["container_port"]
  to_port     = var.lb["container_port"]
  protocol    = "tcp"
  #tfsec:ignore:AWS006
  cidr_blocks       = var.ingress_cidr_blocks
  security_group_id = aws_security_group.default.id
}
resource "aws_security_group_rule" "egress" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  description = "Egress rule"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  #tfsec:ignore:AWS007
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}
