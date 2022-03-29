variable "environment" {}
variable "aws_region_main" {}
variable "tags" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "vpc_cidr_private_subnet" {
  type = list(string)
}
variable "vpc_cidr_public_subnet" {
  type = list(string)
}
variable "allowed_ports" {
  type = list(string)
}
variable "vpc_availability_zone" {
  type = list(string)
}