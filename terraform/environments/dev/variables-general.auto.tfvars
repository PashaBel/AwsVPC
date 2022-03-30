environment     = "dev-private-global-transit-network"
aws_region_main = ["ca-central-1", "eu-west-2", "sa-east-1", "ap-southeast-2"]
tags = {
  name        = "dev"
  description = "private-global-transit-network"
}
vpc_cidr = {
  ca-central-1   = ["10.112.0.0/23"]
  eu-west-2      = ["10.116.0.0/19"]
  sa-east-1      = ["10.120.0.0/20"]
  ap-southeast-2 = ["10.124.0.0/18"]
}
vpc_cidr_subnet = {
  ca-central-1   = ["10.112.0.0/25", "10.112.0.128/25"]
  eu-west-2      = ["10.116.0.0/20", "10.116.16.0/20"]
  sa-east-1      = ["10.120.0.0/26", "10.120.0.64/26"]
  ap-southeast-2 = ["10.124.0.0/19", "10.124.32.0/20"]
}

vpc_availability_zone = {
  ca-central-1   = ["eu-central-1a", "eu-central-1b"]
  eu-west-2      = ["eu-west-2a", "eu-west-2b"]
  sa-east-1      = ["sa-east-1a", "sa-east-1b"]
  ap-southeast-2 = ["ap-southeast-2a", "ap-southeast-2b"]
}

