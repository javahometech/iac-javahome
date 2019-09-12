output "az_names" {
  value = "${local.az_names}"
}

output "pub_sub_ids" {
  value = "${local.pub_sub_ids}"
}

output "vpc_id" {
  value = "${aws_vpc.javahome.id}"
}
