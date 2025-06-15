variable "name" {
  description = "Name for NAT Gateway and EIP"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet to place the NAT Gateway in"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway dependency"
  type        = string
}
