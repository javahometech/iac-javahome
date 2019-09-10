# define variable
variable "instance_tenancy" {
  type = "string"
  description = "Choose tenancy for VPC"
  default = "default"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "region" {
  default = "ap-south-1"
  description = "Choose region to create your stack"
}

variable "nat_map" {
  type = "map"
  default = {
    ap-south-1 = "ami-00b3aa8a93dd09c13"
    us-east-1  = "ami-00a9d4a05375b2763"
  }
}

