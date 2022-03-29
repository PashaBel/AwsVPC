environment     = "dev-private-global-transit-network"
aws_region_main = "eu-central-1"
tags = {
  name        = "dev"
  description = "private-global-transit-network"
}
vpc_cidr                = "10.112.0.0/23"
vpc_cidr_private_subnet = ["10.112.0.0/25"]
vpc_cidr_public_subnet  = ["10.112.0.128/25"]
vpc_availability_zone   = ["eu-central-1a", "eu-central-1b"]
