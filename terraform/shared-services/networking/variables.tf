############################################################
# Project Crystal
# Shared Services Networking
#
# USER INPUT REQUIRED?
#
# No.
#
# Values are supplied from terraform.tfvars.
############################################################

##############################
# AWS
##############################

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI Profile"
  type        = string
}

##############################
# NETWORK
##############################

variable "vpc_name" {
  description = "Shared Services VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "Shared Services VPC CIDR"
  type        = string
}

##############################
# TAGS
##############################

variable "common_tags" {
  description = "Common project tags"
  type        = map(string)
}
############################################################
# PUBLIC SUBNETS
############################################################

variable "public_subnets" {
  description = "Public subnet configuration."

  type = map(object({
    cidr = string
    az   = string
  }))
}

############################################################
# PRIVATE SUBNETS
############################################################

variable "private_subnets" {
  description = "Private subnet configuration."

  type = map(object({
    cidr = string
    az   = string
  }))
}
