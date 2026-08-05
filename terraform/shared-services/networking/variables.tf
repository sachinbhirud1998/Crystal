############################################################
# Project Crystal
# Shared Services Networking
############################################################

############################################################
# AWS Configuration
############################################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
}


############################################################
# VPC
############################################################

variable "vpc_name" {
  description = "Name of the Shared Services VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the Shared Services VPC"
  type        = string
}

############################################################
# Public Subnets
############################################################

variable "public_subnets" {
  description = "Map of public subnets"

  type = map(object({
    cidr = string
    az   = string
  }))
}

############################################################
# Private Subnets
############################################################

variable "private_subnets" {
  description = "Map of private subnets"

  type = map(object({
    cidr = string
    az   = string
  }))
}

############################################################
# Common Tags
############################################################

variable "common_tags" {
  description = "Common resource tags"

  type = map(string)
}

############################################################
# Management Security Group
############################################################

variable "allowed_ssh_cidrs" {
  description = "List of CIDRs allowed to SSH into the management servers"

  type    = list(string)
  default = []
}

############################################################
# Internet Gateway
############################################################

variable "internet_gateway_name" {

  description = "Internet Gateway Name"

  type = string

}

############################################################
# Route Tables
############################################################

variable "public_route_table_name" {

  description = "Public Route Table Name"

  type = string

}

variable "private_route_table_name" {

  description = "Private Route Table Name"

  type = string

}

############################################################
# Management Security Group
############################################################

variable "management_security_group_name" {

  description = "Management Security Group Name"

  type = string

}

############################################################
# VPC Peering (Production)
############################################################

variable "production_vpc_id" {

  description = "Production VPC ID (peer VPC for the peering connection)"

  type = string

}

variable "production_vpc_cidr" {

  description = "Production VPC CIDR (destination for the peering routes)"

  type = string

}

variable "production_account_id" {

  description = "AWS Account ID that owns the Production VPC"

  type = string

}

variable "vpc_peering_connection_name" {

  description = "VPC Peering Connection Name"

  type = string

}
