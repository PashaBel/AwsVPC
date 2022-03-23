locals {
  name = "${var.environment}-vpc"
}

module "vpc" {
  source = "../common/vpc"

  name = local.name
  vpc_cidr = var.vpc_cidr
}