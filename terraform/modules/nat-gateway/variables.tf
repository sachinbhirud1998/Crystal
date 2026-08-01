############################################################
# Project Crystal
# Module      : NAT Gateway
############################################################

############################################################
# NAT Gateway
############################################################

variable "nat_gateway_name" {

  description = "NAT Gateway Name"

  type = string

}

############################################################
# Elastic IP
############################################################

variable "elastic_ip_name" {

  description = "Elastic IP Name"

  type = string

}

############################################################
# Public Subnet
############################################################

variable "public_subnet_id" {

  description = "Public Subnet ID"

  type = string

}

############################################################
# Private Route Table
############################################################

variable "private_route_table_id" {

  description = "Private Route Table ID"

  type = string

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}