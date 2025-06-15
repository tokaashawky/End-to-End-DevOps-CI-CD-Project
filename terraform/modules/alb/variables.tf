variable "name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "target_port" {
  type        = number
  default     = 80
  description = "Port on the target group (e.g. nginx ingress or Jenkins)"
}
