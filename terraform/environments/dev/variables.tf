variable "environment" {}
variable "aws_region_main" {
  type = list(string)
}
variable "tags" {
  type = map(any)
}
variable "vpc_cidr" {
  type = map(any)
}
variable "vpc_cidr_subnet" {
  type = map(any)
}
variable "vpc_availability_zone" {
  type = map(any)
}
variable "allowed_ports" {
  type    = list(string)
  default = ["80", "443", "8080", "8443"]
}