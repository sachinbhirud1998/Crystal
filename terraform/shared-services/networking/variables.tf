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

variable "aws_profile" {
  description = "AWS CLI profile"
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