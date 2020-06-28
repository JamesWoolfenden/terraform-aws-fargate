variable "common_tags" {
  type = map
}

variable "target_group_arn" {
  type = string
}

variable "lb" {
  type = map
}

variable "task_definition" {
}

variable "desired_count" {
  type        = string
  description = "The number of instances of the task definition to place and keep running."
}
