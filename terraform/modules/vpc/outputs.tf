output "vpc_id" {
  description = "ID of the VPC"
  value       = module.bankapp_vpc.vpc_id
}

output "public_subnets" {
  description = "IDs of public subnets"
  value       = module.bankapp_vpc.public_subnets
}

