############################################################
# VPC
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string
}

variable "vpc_cidr" {

  description = "VPC CIDR Block"

  type = string
}

############################################################
# Network ACL Names
############################################################

variable "public_network_acl_name" {

  description = "Public Network ACL Name"

  type = string
}

variable "private_network_acl_name" {

  description = "Private Network ACL Name"

  type = string
}

############################################################
# Subnets
############################################################

variable "public_subnet_ids" {

  description = "List of Public Subnet IDs"

  type = list(string)
}

variable "private_subnet_ids" {

  description = "List of Private Subnet IDs"

  type = list(string)
}

############################################################
# Common Tags
############################################################

variable "tags" {

  description = "Common Resource Tags"

  type = map(string)
}