############################################################
# Project Crystal
# Production Networking
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
# VPC
############################################################

variable "vpc_name" {

  description = "Production VPC Name"

  type = string

}

variable "vpc_cidr" {

  description = "Production VPC CIDR"

  type = string

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
# Network ACL
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
# Security Group
############################################################

variable "bastion_security_group_name" {

  description = "Bastion Security Group Name"

  type = string

}

############################################################
# Public Subnets
############################################################

variable "public_subnets" {

  description = "Public Subnet Configuration"

  type = map(object({

    cidr = string
    az   = string

  }))

}

############################################################
# Private Subnets
############################################################

variable "private_subnets" {

  description = "Private Subnet Configuration"

  type = map(object({

    cidr = string
    az   = string

  }))

}

############################################################
# SSH Access
############################################################

variable "allowed_ssh_cidrs" {

  description = "Allowed SSH CIDRs"

  type = list(string)

}

############################################################
# Common Tags
############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}

############################################################
# NAT Gateway
############################################################

variable "nat_gateway_name" {

  description = "Production NAT Gateway Name"

  type = string

}

variable "elastic_ip_name" {

  description = "Elastic IP Name"

  type = string

}

variable "nat_gateway_public_subnet_name" {

  description = "Public Subnet Name where NAT Gateway will be deployed"

  type = string

}