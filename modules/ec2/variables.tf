variable "vm_count" {
  default     = 1
  description = "Choose no of instances"
}

variable "ami" {
  default     = "ami-0cb0e70f44e1a4bb5"
  description = "Choose ami"
}
variable "instance_type" {
  default     = "t2.micro"
  description = "Choose instance type"
}
variable "security_group_ids" {
  type        = "list"
  description = "Choose security group ids"
}
variable "key_name" {
  default     = ""
  description = "Choose key name"
}

variable "subnet_ids" {
    type = "list"
  description = "Choose subnet id"
}

variable "tags" {
  type = "map"
  default = {
      Name = "JavaHomeEc2"
  }
}
