locals {
  name = "${var.environment}-vpc"
}

module "vpc" {
  source = "../common/vpc"

  name                  = local.name
  vpc_cidr              = var.vpc_cidr
  vpc_cidr_subnet       = var.vpc_cidr_subnet
  vpc_availability_zone = var.vpc_availability_zone
  allowed_ports         = var.allowed_ports
}