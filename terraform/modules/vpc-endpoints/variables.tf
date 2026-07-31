############################################################
# Project Crystal
# VPC Endpoints Module
############################################################

############################################################
# Networking
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

variable "private_subnet_ids" {

  description = "Private Subnet IDs"

  type = list(string)

}

variable "route_table_ids" {

  description = "Route Table IDs"

  type = list(string)

}

variable "security_group_ids" {

  description = "Security Group IDs"

  type = list(string)

}

############################################################
# Interface Endpoints
############################################################

variable "interface_endpoints" {

  description = "Map of Interface VPC Endpoints"

  type = map(object({

    service             = string

    private_dns_enabled = bool

  }))

}

############################################################
# Gateway Endpoints
############################################################

variable "gateway_endpoints" {

  description = "Map of Gateway VPC Endpoints"

  type = map(object({

    service = string

  }))

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Tags applied to all resources"

  type = map(string)

  default = {}

}