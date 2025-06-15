variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "devops-vpc"
}

variable "subnets" {
  default = {
    public-1 = {
      cidr   = "10.0.0.0/24"
      az     = "us-east-1a"
      public = true
    }
    public-2 = {
      cidr   = "10.0.1.0/24"
      az     = "us-east-1b"
      public = true
    }
    private-1 = {
      cidr   = "10.0.2.0/24"
      az     = "us-east-1a"
      public = false
    }
    private-2 = {
      cidr   = "10.0.3.0/24"
      az     = "us-east-1b"
      public = false
    }
  }
}
