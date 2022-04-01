environment = "dev-private-global-transit-network"
tags = {
  name        = "dev"
  description = "private-global-transit-network"
}
vpc_cidr = {
  canada    = "10.112.0.0/23"
  uk        = "10.116.0.0/19"
  brazil    = "10.120.0.0/20"
  australia = "10.124.0.0/18"
}
vpc_cidr_subnet = {
  canada    = ["10.112.0.0/25", "10.112.0.128/25"]
  uk        = ["10.116.0.0/20", "10.116.16.0/20"]
  brazil    = ["10.120.0.0/26", "10.120.0.64/26"]
  australia = ["10.124.0.0/19", "10.124.32.0/20"]
}

vpc_availability_zone = {
  canada    = ["ca-central-1a", "ca-central-1b"]
  uk        = ["eu-west-2a", "eu-west-2b"]
  sa-east-1 = ["sa-east-1a", "sa-east-1b"]
  australia = ["ap-southeast-2a", "ap-southeast-2b"]
}

