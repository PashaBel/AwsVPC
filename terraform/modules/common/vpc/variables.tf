variable "vpc_cidr" {}
variable "name" {}
variable "allowed_ports" {
  type = list(string)
}