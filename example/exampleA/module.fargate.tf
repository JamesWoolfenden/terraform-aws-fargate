module "fargate" {
  source           = "../../"
  common_tags      = var.common_tags
  task_definition  = var.task_definition
  name             = "my-first-service"
  lb               = var.lb
  cluster          = "arn:aws:ecs:eu-west-1:${data.aws_caller_identity.current.account_id}:cluster/${var.cluster}"
  subnets          = data.aws_subnet_ids.cluster.ids
  target_group_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.target_group_arn}"
  vpc_id           = element(data.aws_vpcs.cluster.ids, 0)
}
