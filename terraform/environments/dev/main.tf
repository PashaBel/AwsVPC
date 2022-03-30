provider "aws" {
  region = "eu-central-1"
}

module "init" {
  source = "../../modules/main"

  environment           = var.environment
  aws_region_main       = var.aws_region_main
  tags                  = var.tags
  vpc_cidr              = var.vpc_cidr
  vpc_cidr_subnet       = var.vpc_cidr_subnet
  vpc_availability_zone = var.vpc_availability_zone
  allowed_ports         = var.allowed_ports
}