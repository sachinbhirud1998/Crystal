############################################################
# Shared Services VPC
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
# Public Subnets
############################################################

output "public_subnet_ids" {

  description = "Public Subnet IDs"

  value = module.shared_services_subnets.public_subnet_ids

}

############################################################
# Private Subnets
############################################################

output "private_subnet_ids" {

  description = "Private Subnet IDs"

  value = module.shared_services_subnets.private_subnet_ids

}

############################################################
# Internet Gateway
############################################################

output "internet_gateway_id" {

  description = "Internet Gateway ID"

  value = module.shared_services_igw.igw_id

}

output "internet_gateway_arn" {

  description = "Internet Gateway ARN"

  value = module.shared_services_igw.igw_arn

}

############################################################
# Public Route Table
############################################################

output "public_route_table_id" {

  description = "Public Route Table ID"

  value = module.shared_services_route_table.public_route_table_id

}

output "public_route_table_arn" {

  description = "Public Route Table ARN"

  value = module.shared_services_route_table.public_route_table_arn

}

############################################################
# Private Route Table
############################################################

output "private_route_table_id" {

  description = "Private Route Table ID"

  value = module.shared_services_route_table.private_route_table_id

}

output "private_route_table_arn" {

  description = "Private Route Table ARN"

  value = module.shared_services_route_table.private_route_table_arn

}

############################################################
# Management Security Group
############################################################

output "management_security_group_id" {

  description = "Management Security Group ID"

  value = module.management_security_group.security_group_id

}

output "management_security_group_arn" {

  description = "Management Security Group ARN"

  value = module.management_security_group.security_group_arn

}