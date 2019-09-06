# define variable
variable "instance_tenancy" {
  type = "string"
  description = "Choose tenancy for VPC"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
