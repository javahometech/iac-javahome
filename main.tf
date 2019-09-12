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
  instance_tenancy = "dedicated"
  vpc_cidr         = "173.21.0.0/16"
}

