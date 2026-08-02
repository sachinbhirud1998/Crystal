############################################################
# Project Crystal
# Module      : Route Table
############################################################

############################################################
# VPC
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

############################################################
# Public Route Table
############################################################

variable "public_route_table_name" {

  description = "Public Route Table Name"

  type = string

}

############################################################
# Private Route Table
############################################################

variable "private_route_table_name" {

  description = "Private Route Table Name"

  type = string

}

############################################################
# Internet Gateway
############################################################

variable "internet_gateway_id" {

  description = "Internet Gateway ID"

  type = string

}

############################################################
# Public Subnets
############################################################

variable "public_subnet_ids" {

  description = "Public Subnet IDs"

  type = list(string)

}

############################################################
# Private Subnets
############################################################

variable "private_subnet_ids" {

  description = "Private Subnet IDs"

  type = list(string)

}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)

  default = {}

}