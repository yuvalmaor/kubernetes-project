resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.base_name} Main Internet Gateway"
  }
}
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" # Default route for internet traffic
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Main Route Table"
  }
}
resource "aws_route_table_association" "subnet" {
  count          = length(var.cidr_block) # Number of subnets
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.main.id
}

resource "aws_subnet" "subnet" {
  count = length(var.cidr_block)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_block[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch[count.index]
  tags = {
    "Name"  ="${var.base_name}subnet-${count.index}"
  }
#   tags = merge(var.default_tags, {
#     "Name"  = var.subnet_names[count.index]
#     "owner" = var.owner_email
#     "duedate" = var.due_date
#   })
}

resource "aws_security_group" "default" {
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = {
    "Name"  ="${var.base_name}sg"
  }
#   tags = merge(var.default_tags, {
#     "Name"  = "Security Group"
#     "owner" = var.owner_email
#     "duedate" = var.due_date
#   })
}
