data "aws_vpcs" "cluster" {}
data "aws_subnets" "cluster" {
  filter {
    name   = "vpc-id"
    values = [element(tolist(data.aws_vpcs.cluster.ids), 0)]
  }
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
