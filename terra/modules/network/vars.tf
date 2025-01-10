variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "vpc_name" {
  description = "name for the VPC"
  type        = string
}

variable "base_name" {
  description = "name for the VPC"
  type        = string
}

variable "cidr_block" {
  description = "List of CIDR blocks for subnets"
  type = list(string)
}

variable "availability_zone" {
  description = "List of availability zones for subnets"
  type = list(string)
}

variable "map_public_ip_on_launch" {
  description = "List of boolean values for whether public IPs are assigned to subnets"
  type = list(bool)
}

variable "subnet_names" {
  description = "List of names for the subnets"
  type = list(string)
}

variable "ingress_rules" {
  description = "List of ingress security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

# variable "default_tags" {
#   description = "Default tags for all resources"
#   type = map(string)
#   default = {
#     "Environment" = "Production"
#   }
# }

# variable "owner_email" {
#   description = "The owner's email for resource tagging"
#   type        = string
# }

# variable "due_date" {
#   description = "The due date for resource tagging"
#   type        = string
# }