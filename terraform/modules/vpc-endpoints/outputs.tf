############################################################
# Project Crystal
# VPC Endpoints Module
############################################################

############################################################
# Interface Endpoint Outputs
############################################################

output "interface_endpoint_ids" {

  description = "Map of Interface Endpoint IDs"

  value = {
    for endpoint, resource in aws_vpc_endpoint.interface :
    endpoint => resource.id
  }

}

output "interface_endpoint_arns" {

  description = "Map of Interface Endpoint ARNs"

  value = {
    for endpoint, resource in aws_vpc_endpoint.interface :
    endpoint => resource.arn
  }

}

############################################################
# Gateway Endpoint Outputs
############################################################

output "gateway_endpoint_ids" {

  description = "Map of Gateway Endpoint IDs"

  value = {
    for endpoint, resource in aws_vpc_endpoint.gateway :
    endpoint => resource.id
  }

}

output "gateway_endpoint_prefix_list_ids" {

  description = "Map of Gateway Endpoint Prefix List IDs"

  value = {
    for endpoint, resource in aws_vpc_endpoint.gateway :
    endpoint => resource.prefix_list_id
  }

}