
module "bankapp_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs            = var.availability_zones
  public_subnets = var.public_subnets

  map_public_ip_on_launch = true

  enable_nat_gateway = false

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Project     = "AI-BankApp"
    Environment = var.environment
  }
}
