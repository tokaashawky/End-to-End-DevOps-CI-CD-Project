variable "name" {
  description = "Identifier and tag for RDS instance"
  type        = string
}

variable "engine_version" {
  default     = "8.0"
  description = "MySQL engine version"
  type        = string
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "RDS instance type"
  type        = string
}

variable "allocated_storage" {
  default     = 20
  description = "Storage size (in GB)"
  type        = number
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial DB name"
  type        = string
}

variable "port" {
  default     = 3306
  type        = number
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
