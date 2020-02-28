variable "common_tags" {
  type = map
}


variable "target_group_arn" {
  type = string
}

variable "cluster" {
  type = string
}

variable "lb" {
  type = map
  default = {
    container_name = ""
    container_port = ""
  }

}

variable "task_definition" {
}
