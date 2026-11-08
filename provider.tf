provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket = "bcmstate-demo16"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

module "networking" {
  source = "./modules/networking"
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.networking.subnet_ids[0]
  vpc_id        = module.networking.vpc_id
  ingress_rules = var.web_sg_rules

  instance_name       = "HelloWorld"
  security_group_name = "allow_tls"
}