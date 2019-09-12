resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.javahome.id}"

  tags = {
    Name = "JavaHomeIGW"
  }
}

# Create route table for public subnets and attach internet gateway

resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.javahome.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  count          = "${local.az_count}"
  subnet_id      = "${local.pub_sub_ids[count.index]}"
  route_table_id = "${aws_route_table.public_route.id}"
}
