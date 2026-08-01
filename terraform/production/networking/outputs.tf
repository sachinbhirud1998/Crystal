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
# Public Route Table
############################################################

output "public_route_table_id" {

  description = "Production Public Route Table ID"

  value = module.production_route_table.public_route_table_id

}

output "public_route_table_arn" {

  description = "Production Public Route Table ARN"

  value = module.production_route_table.public_route_table_arn

}

############################################################
# Private Route Table
############################################################

output "private_route_table_id" {

  description = "Production Private Route Table ID"

  value = module.production_route_table.private_route_table_id

}

output "private_route_table_arn" {

  description = "Production Private Route Table ARN"

  value = module.production_route_table.private_route_table_arn

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

############################################################
# NAT Gateway
############################################################

output "nat_gateway_id" {

  description = "Production NAT Gateway ID"

  value = module.production_nat_gateway.nat_gateway_id

}

output "nat_gateway_private_ip" {

  description = "Production NAT Gateway Private IP"

  value = module.production_nat_gateway.nat_gateway_private_ip

}

output "nat_gateway_public_ip" {

  description = "Production NAT Gateway Public IP"

  value = module.production_nat_gateway.nat_gateway_public_ip

}

############################################################
# Elastic IP
############################################################

output "nat_gateway_elastic_ip" {

  description = "Production NAT Gateway Elastic IP"

  value = module.production_nat_gateway.elastic_ip_public_ip

}

output "nat_gateway_elastic_ip_allocation_id" {

  description = "Production NAT Gateway Elastic IP Allocation ID"

  value = module.production_nat_gateway.elastic_ip_allocation_id

}