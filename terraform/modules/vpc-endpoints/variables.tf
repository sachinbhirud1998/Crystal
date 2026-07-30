############################################################
# Project Crystal
# Module      : VPC Endpoints
############################################################

############################################################
# VPC
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_ids" {

  description = "Private Subnet IDs for Interface Endpoints"

  type = list(string)

}

variable "route_table_ids" {

  description = "Route Table IDs for Gateway Endpoints"

  type = list(string)

}

variable "security_group_ids" {

  description = "Security Group IDs for Interface Endpoints"

  type = list(string)

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

  default = {}

}

############################################################
# Gateway Endpoints
############################################################

variable "gateway_endpoints" {

  description = "Gateway VPC Endpoints"

  type = map(object({

    service = string

  }))

  default = {}

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}