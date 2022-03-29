locals {
  name = "${var.environment}-vpc"
}

module "vpc" {
  source = "../common/vpc"

  name                    = local.name
  vpc_cidr                = var.vpc_cidr
  vpc_cidr_private_subnet = var.vpc_cidr_private_subnet
  vpc_cidr_public_subnet  = var.vpc_cidr_public_subnet
  vpc_availability_zone   = var.vpc_availability_zone
  allowed_ports           = var.allowed_ports
}