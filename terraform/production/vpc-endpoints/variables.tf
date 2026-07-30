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
############################################################
Project Crystal
Production VPC Endpoints
############################################################

terraform {

  required_version = ">= 1.12.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}
############################################################
Project Crystal
Production VPC Endpoints
############################################################

############################################################
AWS Configuration
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "aws_profile" {

  description = "AWS CLI Profile"

  type = string

}

############################################################
Security Group
############################################################

variable "endpoint_security_group_name" {

  description = "VPC Endpoint Security Group Name"

  type = string

}

############################################################
Interface Endpoints
############################################################

variable "interface_endpoints" {

  description = "Interface VPC Endpoints"

  type = map(object({

    service_name = string

    private_dns_enabled = bool

  }))

}

############################################################
Gateway Endpoints
############################################################

variable "gateway_endpoints" {

  description = "Gateway VPC Endpoints"

  type = map(object({

    service_name = string

  }))

}

############################################################
Common Tags
############################################################

variable "common_tags" {

  description = "Common Resource Tags"

  type = map(string)

}
