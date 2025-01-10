
variable "my_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}




variable "aws_region" {
  description = "AWS region for resources"
  type        = string
}


#*************
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
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

variable "default_tags" {
  description = "Default tags for all resources"
  type = map(string)


}
variable "vpc_name" {
  description = "name for the VPC"
  type        = string
}


variable "base_name" {
#  description = "name for the VPC"
  type        = string
}


variable "image_version" {
  #description = "name for the VPC"
  type        = string
}

variable "app_domain" {
  #description = "name for the VPC"
  type        = string
}
variable "domain_name" {
  #description = "name for the VPC"
  type        = string
}


variable "zone_id" {
  #description = "name for the VPC"
  type        = string
}
