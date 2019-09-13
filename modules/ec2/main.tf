resource "aws_instance" "vms" {
  count                  = "${var.vm_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = "${var.security_group_ids}"
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_ids[count.index]}"
  tags = "${var.tags}"
}
