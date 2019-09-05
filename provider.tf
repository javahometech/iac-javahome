provider "aws"{
    region  = "ap-south-1"
}

# Create VPC

resource "aws_vpc" "javahome" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
      Name = "JavaHome"
      Batch = "7AM"
    }
}

resource "aws_subnet" "web" {
    vpc_id = "${aws_vpc.javahome.id}"
    cidr_block = "10.0.1.0/24"

    tags = {
      Name = "Main"
    }
}



