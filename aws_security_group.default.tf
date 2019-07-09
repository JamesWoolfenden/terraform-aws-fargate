resource "aws_security_group" "default" {
  count = var.enabled

  name        = local.security_group_name
  description = "ECS Allowed Ports"
  vpc_id      = var.vpc_id
  tags        = var.common_tags
}

resource "aws_security_group_rule" "ingress" {
  count = var.enabled

  type              = "ingress"
  from_port         = var.container_port
  to_port           = var.container_port
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidr_blocks
  security_group_id = aws_security_group.default.0.id
}

resource "aws_security_group_rule" "egress" {
  count = var.enabled

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.0.id
}
