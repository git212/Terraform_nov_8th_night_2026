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