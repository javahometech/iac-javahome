locals {
  az_names = "${data.aws_availability_zones.azs.names}"
  az_count = "${length(local.az_names)}"
  pub_sub_ids = "${aws_subnet.public.*.id}"
  pri_sub_ids = "${aws_subnet.private.*.id}"
}