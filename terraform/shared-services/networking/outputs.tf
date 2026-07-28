############################################################
# VPC
############################################################

output "vpc_id" {

  description = "Shared Services VPC ID"

  value = module.shared_services_vpc.vpc_id

}

output "vpc_arn" {

  description = "Shared Services VPC ARN"

  value = module.shared_services_vpc.vpc_arn

}

output "vpc_cidr" {

  description = "Shared Services VPC CIDR"

  value = module.shared_services_vpc.vpc_cidr

}

############################################################
# PUBLIC SUBNETS
############################################################

output "public_subnet_ids" {

  description = "Public Subnet IDs"

  value = module.shared_services_subnets.public_subnet_ids

}

############################################################
# PRIVATE SUBNETS
############################################################

output "private_subnet_ids" {

  description = "Private Subnet IDs"

  value = module.shared_services_subnets.private_subnet_ids

}