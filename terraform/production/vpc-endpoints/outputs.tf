############################################################
# Project Crystal
# Production VPC Endpoints
############################################################

############################################################
# Security Group Outputs
############################################################

output "endpoint_security_group_id" {

  description = "VPC Endpoint Security Group ID"

  value = aws_security_group.vpc_endpoints.id

}

output "endpoint_security_group_arn" {

  description = "VPC Endpoint Security Group ARN"

  value = aws_security_group.vpc_endpoints.arn

}

############################################################
# Interface Endpoint Outputs
############################################################

output "interface_endpoint_ids" {

  description = "Map of Interface Endpoint IDs"

  value = module.production_vpc_endpoints.interface_endpoint_ids

}

output "interface_endpoint_arns" {

  description = "Map of Interface Endpoint ARNs"

  value = module.production_vpc_endpoints.interface_endpoint_arns

}

############################################################
# Gateway Endpoint Outputs
############################################################

output "gateway_endpoint_ids" {

  description = "Map of Gateway Endpoint IDs"

  value = module.production_vpc_endpoints.gateway_endpoint_ids

}

output "gateway_endpoint_prefix_list_ids" {

  description = "Map of Gateway Endpoint Prefix List IDs"

  value = module.production_vpc_endpoints.gateway_endpoint_prefix_list_ids

}