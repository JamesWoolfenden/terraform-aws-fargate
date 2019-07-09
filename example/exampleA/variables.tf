variable "common_tags" {
  type = map
}

variable "container_port" {
  type = string
}

variable "target_group_arn" {
  type = string

}

variable "cluster" {
  type = string
}
