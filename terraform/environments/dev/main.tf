provider "aws" {
  alias  = "canada"
  region = "ca-central-1"
}

provider "aws" {
  alias  = "uk"
  region = "eu-west-2"
}

provider "aws" {
  alias  = "brazil"
  region = "sa-east-1"
}

provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"
}

module "canada" {

  source = "../../modules/main"

  environment           = var.environment
  aws_region_main       = "canada"
  tags                  = var.tags
  vpc_cidr              = var.vpc_cidr
  vpc_cidr_subnet       = var.vpc_cidr_subnet
  vpc_availability_zone = var.vpc_availability_zone
  allowed_ports         = var.allowed_ports
}