variable vpc_cidr {
  type        = string
  description = "CIDR block of VPC"
}
variable region {
  type        = string
  default     = "us-east-1"
}
variable instance_type {
  type        = string
  description = "instance_type of VMS"
}
variable subnets {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name = string
    type = string 
  }))
}
variable db_password {
  type        = string
  description = "RDS password"
  sensitive   = true
}
variable db_username {
  type        = string
  description = "RDS username"
}
variable db_instance_class {
  type        = string
  description = "db_instance_class"
}
variable db_S_class {
  type        = string
  description = "db_Storage_class"
}
