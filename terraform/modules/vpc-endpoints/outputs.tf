############################################################
Project Crystal
Module      : VPC Endpoints
############################################################

############################################################
Interface Endpoints
############################################################

output "interface_endpoint_ids" {

  description = "Interface VPC Endpoint IDs"

  value = {

    for endpoint_name, endpoint in aws_vpc_endpoint.interface :

    endpoint_name => endpoint.id

  }

}

output "interface_endpoint_arns" {

  description = "Interface VPC Endpoint ARNs"

  value = {

    for endpoint_name, endpoint in aws_vpc_endpoint.interface :

    endpoint_name => endpoint.arn

  }

}

############################################################
Gateway Endpoints
############################################################

output "gateway_endpoint_ids" {

  description = "Gateway VPC Endpoint IDs"

  value = {

    for endpoint_name, endpoint in aws_vpc_endpoint.gateway :

    endpoint_name => endpoint.id

  }

}

output "gateway_endpoint_prefix_list_ids" {

  description = "Gateway Endpoint Prefix List IDs"

  value = {

    for endpoint_name, endpoint in aws_vpc_endpoint.gateway :

    endpoint_name => endpoint.prefix_list_id

  }

}
