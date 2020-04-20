data "aws_vpcs" "cluster" {}

data "aws_subnet_ids" "cluster" {
  vpc_id = element(tolist(data.aws_vpcs.cluster.ids), 0)
}

data "aws_caller_identity" "current" {}


data "aws_region" "current" {}
