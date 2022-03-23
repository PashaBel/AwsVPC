variable "environment" {}
variable "aws_region_main" {}
variable "tags" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "allowed_ports" {
  type = list(string)
}
