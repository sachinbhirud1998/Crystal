############################################################
# Project Crystal
# Production VPC Endpoints
############################################################

############################################################
# AWS Configuration
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
# Security Group
############################################################

variable "endpoint_security_group_name" {

  description = "VPC Endpoint Security Group Name"

  type = string

}

############################################################
# Interface Endpoints
############################################################

variable "interface_endpoints" {

  description = "Interface VPC Endpoints"

  type = map(object({

    service = string

    private_dns_enabled = bool

  }))

}

############################################################
# Gateway Endpoints
############################################################

variable "gateway_endpoints" {

  description = "Gateway VPC Endpoints"

  type = map(object({

    service = string

  }))

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}
