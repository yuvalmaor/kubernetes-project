# terraform.tfvars
#region        = "us-east-1"
#instance_type = "t2.micro"

aws_region = "us-east-1"
#due_date = "14.12.2024"
#owner_email = "youval.mejerowicz@nixs.com"
my_repository_name = "youval.mejerowicz-skillup-ecr"

#***********************
vpc_cidr = "10.0.0.0/16"

cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]

availability_zone = ["us-east-1a","us-east-1b"]

map_public_ip_on_launch = [true, true]

subnet_names = ["subnet-1", "subnet-2"]

ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

default_tags = {
  Environment = "Test"
  due_date = "20.12.2024"
  owner = "youval.mejerowicz@nixs.com"

}

vpc_name ="youval.mejerowicz-skillup-vpc"
base_name = "youval-mejerowicz-skillup-"
image_version = "1.0.5"
app_domain = "app.yuvallab.xyz"
domain_name             = "aws.yuvallab.xyz"
zone_id = "Z02043683PYFJQXU09ECE"