############################################################
# Project Crystal
# Module      : Route Table
############################################################

##############################
# VPC
##############################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

##############################
# Route Table
##############################

variable "route_table_name" {
  description = "Route Table Name"
  type        = string
}

##############################
# Internet Gateway
##############################

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

##############################
# Public Subnets
##############################

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
}

##############################
# Tags
##############################

variable "tags" {
  description = "Common Tags"
  type        = map(string)

  default = {}
}