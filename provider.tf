provider "aws"{
    region  = "ap-south-1"
}

# Create VPC

resource "aws_vpc" "javahome" {
    cidr_block       = "${var.vpc_cidr}"
    instance_tenancy = "${var.instance_tenancy}"
    tags = {
      Name = "JavaHome"
      Batch = "7AM"
    }
}
# Private subnets - one subnet for each az.

resource "aws_subnet" "private" {
    count = "${length(local.az_names)}"
    vpc_id     = "${aws_vpc.javahome.id}"
    cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
    availability_zone = "${local.az_names[count.index]}"
    tags = {
      Name = "Main"
    }
}



