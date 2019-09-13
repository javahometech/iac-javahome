provider "aws" {
  region = "${var.region}"
}

# Remote state file configuration

terraform {
  backend "s3" {
    bucket         = "javahome-8989"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "javahome"
  }
}

module "networking" {
  source           = "./modules/networking"
  instance_tenancy = "default"
  vpc_cidr         = "173.21.0.0/16"
}

module "web_app" {
  source = "./modules/ec2"
  vm_count = 3
  subnet_ids = "${module.networking.pub_sub_ids}"
  security_group_ids = ["${aws_security_group.web.id}"]
}

