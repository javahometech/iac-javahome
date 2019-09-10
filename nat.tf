resource "aws_instance" "nat" {
  ami           = "${var.nat_map[var.region]}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public.*.id[0]}"
  tags = {
    Name = "JavaHomeNAT"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = "${aws_vpc.javahome.id}"

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }

  tags = {
    Name = "PrivateTable"
  }
}

resource "aws_route_table_association" "b" {
    count = "${local.az_count}" 
    subnet_id      = "${local.pri_sub_ids[count.index]}"
    route_table_id = "${aws_route_table.private_route.id}"
}