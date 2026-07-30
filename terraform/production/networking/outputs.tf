############################################################
# Project Crystal
# Production Networking
############################################################

############################################################
# Production VPC
############################################################

output "vpc_id" {

  description = "Production VPC ID"

  value = module.production_vpc.vpc_id

}

output "vpc_arn" {

  description = "Production VPC ARN"

  value = module.production_vpc.vpc_arn

}

output "vpc_cidr" {

  description = "Production VPC CIDR"

  value = module.production_vpc.vpc_cidr

}

############################################################
# Public Subnets
############################################################

output "public_subnet_ids" {

  description = "Production Public Subnet IDs"

  value = module.production_subnets.public_subnet_ids

}

############################################################
# Private Subnets
############################################################

output "private_subnet_ids" {

  description = "Production Private Subnet IDs"

  value = module.production_subnets.private_subnet_ids

}

############################################################
# Internet Gateway
############################################################

output "internet_gateway_id" {

  description = "Production Internet Gateway ID"

  value = module.production_internet_gateway.igw_id

}

output "internet_gateway_arn" {

  description = "Production Internet Gateway ARN"

  value = module.production_internet_gateway.igw_arn

}

############################################################
# Route Table
############################################################

output "public_route_table_id" {

  description = "Production Public Route Table ID"

  value = module.production_route_table.route_table_id

}

output "public_route_table_arn" {

  description = "Production Public Route Table ARN"

  value = module.production_route_table.route_table_arn

}

############################################################
# Network ACL
############################################################

output "public_network_acl_id" {

  description = "Production Public Network ACL ID"

  value = module.production_network_acl.public_network_acl_id

}

output "private_network_acl_id" {

  description = "Production Private Network ACL ID"

  value = module.production_network_acl.private_network_acl_id

}

############################################################
# Bastion Security Group
############################################################

output "bastion_security_group_id" {

  description = "Production Bastion Security Group ID"

  value = module.bastion_security_group.security_group_id

}

output "bastion_security_group_arn" {

  description = "Production Bastion Security Group ARN"

  value = module.bastion_security_group.security_group_arn

}