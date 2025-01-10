provider "aws" {
  region = var.aws_region
    default_tags {
    tags = var.default_tags
    }
}

module "ecr_repository" {
  source           = "./modules/ecr"
  my_repository_name  = var.my_repository_name
#  owner_email      = var.owner_email
#  due_date         = var.due_date
  base_name = var.base_name


}

module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  subnet_names            = var.subnet_names
  ingress_rules           = var.ingress_rules
  egress_rules            = var.egress_rules
  base_name = var.base_name
#  default_tags            = var.default_tags
#  owner_email = var.owner_email
#  due_date    = var.due_date

}


