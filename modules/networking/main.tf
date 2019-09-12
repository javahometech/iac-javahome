
# Resource to create S3 bucket

# Create VPC

resource "aws_vpc" "javahome" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.instance_tenancy}"
  tags = {
    Name     = "JavaHome-${terraform.workspace}"
    Batch    = "7AM"
    Location = "Banglore"
    Environment = "${terraform.workspace}"
  }
}
# Private subnets - one subnet for each az.
resource "aws_subnet" "private" {
  count             = "${length(local.az_names)}"
  vpc_id            = "${aws_vpc.javahome.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  availability_zone = "${local.az_names[count.index]}"
  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

# Public subnets - one subnet for each az.
resource "aws_subnet" "public" {
  count                   = "${length(local.az_names)}"
  vpc_id                  = "${aws_vpc.javahome.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 8, local.az_count + count.index)}"
  availability_zone       = "${local.az_names[count.index]}"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet-${count.index + 1}"
  }
}