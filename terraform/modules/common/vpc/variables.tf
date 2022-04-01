variable "aws_region_main" {}
variable "vpc_cidr" {
  type = map(any)
}
variable "vpc_cidr_subnet" {
  type = map(any)
}
variable "name" {}
variable "allowed_ports" {
  type = list(string)
}
variable "vpc_availability_zone" {
  type = map(any)
}