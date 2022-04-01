# Create VPC 
resource "aws_vpc" "this" {
  cidr_block                       = lookup(var.vpc_cidr, var.aws_region_main)
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

# Create private subnets for VPC
resource "aws_subnet" "private" {
  count             = length(lookup(var.vpc_cidr_subnet, var.aws_region_main))
  cidr_block        = element(lookup(var.vpc_cidr_subnet, var.aws_region_main), count.index)
  vpc_id            = aws_vpc.this.id
  availability_zone = element(lookup(var.vpc_availability_zone, var.aws_region_main), count.index)
  tags = {
    Name = "private_subnet_${element(lookup(var.vpc_availability_zone, var.aws_region_main), count.index)}"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "internet_gateway"
  }
}

## Create Route Table
#resource "aws_route_table" "route_table" {
#  vpc_id = aws_vpc.this.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.this.id
#  }
#  tags = {
#    Name = "internet_gateway_default"
#  }
#}
#resource "aws_route_table_association" "aws_route_table_association" {
#  route_table_id = aws_route_table.route_table.id
#  subnet_id      = aws_subnet.private.id
#}
