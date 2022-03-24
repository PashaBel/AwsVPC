# Create VPC 
resource "aws_vpc" "this" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_support               = "true"
  enable_dns_hostnames             = "true"
  assign_generated_ipv6_cidr_block = "false"
  enable_classiclink               = "false"
  tags = {
    Name = "${var.name}"
  }
}

# Create security group rule
resource "aws_security_group" "aws_sg" {
  name = "aws_sg"
  lifecycle {
    create_before_destroy = true
  }
  # allow for TCP 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow from TCP 22
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create sg rule
resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  count             = length(var.allowed_ports)
  security_group_id = aws_security_group.aws_sg.id
  from_port         = element(var.allowed_ports, count.index)
  to_port           = element(var.allowed_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  count             = length(var.allowed_ports)
  security_group_id = aws_security_group.aws_sg.id
  from_port         = element(var.allowed_ports, count.index)
  to_port           = element(var.allowed_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Create subnets for VPC
resource "aws_subnet" "this" {
  count             = length(var.vpc_cidr_subnet)
  cidr_block        = element(var.vpc_cidr_subnet, count.index)
  vpc_id            = aws_vpc.this.id
  availability_zone = element(var.vpc_availability_zone, count.index)
  tags = {
    Name = "private_subnet_${element(var.vpc_availability_zone, count.index)}"
  }
}