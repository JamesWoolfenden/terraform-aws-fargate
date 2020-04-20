module "fargate" {
  source           = "../../"
  common_tags      = var.common_tags
  desired_count    = var.desired_count
  task_definition  = var.task_definition
  service_name     = "my-first-service"
  lb               = var.lb
  subnets          = data.aws_subnet_ids.cluster.ids
  target_group_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.target_group_arn}"
  vpc_id           = element(tolist(data.aws_vpcs.cluster.ids), 0)
}
